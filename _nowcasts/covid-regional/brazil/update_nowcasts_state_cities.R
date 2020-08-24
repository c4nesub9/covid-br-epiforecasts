# Packages -----------------------------------------------------------------
require(EpiNow, quietly = TRUE)
require(NCoVUtils, quietly = TRUE)
require(future, quietly = TRUE)
require(dplyr, quietly = TRUE)
require(tidyr, quietly = TRUE)
require(magrittr, quietly = TRUE)
require(data.table)
require(forecastHybrid)
require(stringr)

argv <- commandArgs(TRUE)

state <- ifelse(length(argv) >= 1, toupper(argv[1]), "PB")
results_dir <- ifelse(length(argv) >= 2, argv[2], paste0("brazil/cities-", tolower(state)))
results_dir <- gsub("/$", "", results_dir) # remove trailing slash
ncores <- ifelse(length(argv) >= 3, as.integer(argv[3]), future::availableCores())

# Get cases ---------------------------------------------------------------

min_total_cases <- 10
min_forecast_cases <- 10
case_limit <- 1
max_regions <- 120 

NCoVUtils::reset_cache()
cases <- NCoVUtils::get_brazil_regional_cases(geography = "municipalities") %>%
  dplyr::group_by(city_name) %>%
  dplyr::mutate(
    cases = ifelse(cases < 0, 0, cases),
    total_cases = sum(cases, na.rm = TRUE),
    cases_last_week = sum(cases[date >= max(date) - lubridate::days(7)],
                          na.rm = TRUE),
    max_daily_cases = max(cases, na.rm = TRUE)
  ) %>%
  dplyr::ungroup() %>%
  dplyr::mutate(city_name = sapply(str_split(city_name, pattern = "/"),
                                   function(x) paste(x[2:1], collapse = "-"))) %>%
  dplyr::rename(region = city_name, region_code = state_code) %>%
  dplyr::filter(total_cases >= min_total_cases,
                cases_last_week >= min_forecast_cases,
                max_daily_cases >= case_limit,
                region_code %in% state,
                !str_detect(region, "CASO SEM LOCALIZAÇÃO DEFINIDA"))

state_codes <- sort(unique(cases$region_code))

region_codes <- cases %>%
  dplyr::select(region, region_code) %>%
  unique()

#saveRDS(region_codes, "brazil/data/region_codes.rds")

top_regions <- cases %>%
  group_by(region) %>%
  summarise(cases_last_week = max(cases_last_week)) %>%
  slice_max(cases_last_week, n = max_regions) %>%
  pull(region)

cases <- cases %>%
  filter(region %in% top_regions) %>%
  dplyr::select(-deaths, -total_cases, -cases_last_week, -max_daily_cases) %>% 
  dplyr::rename(local = cases) %>%
  dplyr::mutate(imported = 0) %>%
  tidyr::gather(key = "import_status", value = "confirm", local, imported) %>% 
  tidyr::drop_na(region)

n_regions <- length(unique(cases$region))
print(paste("Number of cities:", n_regions))

# Shared delay ------------------------------------------------------------

delay_defs <- readRDS("delays.rds")

# Set up cores -----------------------------------------------------
if (!interactive()){
  options(future.fork.enable = TRUE)
}

define_n_workers <- function(n_regions, n_cores) {
  rounds <- ceiling(n_regions / n_cores)
  n_workers <- ceiling(n_regions / rounds)
  return(n_workers)
}

n_workers = define_n_workers(n_regions, ncores)
future::plan("multiprocess", workers = n_workers)

#for (state_code in state_codes) {
#  cases_state <- filter(cases, region_code == state_code)
  
# Run pipeline ----------------------------------------------------

EpiNow::regional_rt_pipeline(
  cases = cases,
  delay_defs = delay_defs,
  target_folder = results_dir,
  case_limit = case_limit,
  min_forecast_cases = min_forecast_cases,
  horizon = 14,
  nowcast_lag = 10,
  approx_delay = TRUE,
  report_forecast = TRUE,
  forecast_model = function(y, ...){EpiSoon::forecastHybrid_model(
    y = y[max(1, length(y) - 21):length(y)],
    model_params = list(models = "aefz", weights = "equal"),
    forecast_params = list(PI.combination = "mean"), ...)}
)


# Summarise results -------------------------------------------------------

#EpiNow::regional_summary(results_dir = results_dir,
#                         summary_dir = paste0(results_dir, "-summary"),
#                         target_date = "latest",
#                         region_scale = "Region")
#}
