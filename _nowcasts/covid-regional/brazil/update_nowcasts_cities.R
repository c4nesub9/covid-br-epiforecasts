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

results_dir <- ifelse(length(argv) >= 1, argv[1], "brazil/cities")
results_dir <- gsub("/$", "", results_dir) # remove trailing slash
city_list_file <- ifelse(length(argv) >= 2, argv[2], "brazil/data/ne-capitais.csv")
min_forecast_cases <- ifelse(length(argv) >= 3, argv[3], 100)
case_limit <- ifelse(length(argv) >= 4, argv[4], 20)
ncores <- ifelse(length(argv) >= 5, as.integer(argv[5]), future::availableCores())

# Get cases ---------------------------------------------------------------
filter_cities <- read.csv(city_list_file) %>%
	mutate(name = paste(UF, city, sep = "-"))

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
  dplyr::filter(cases_last_week >= min_forecast_cases,
                max_daily_cases >= case_limit,
                toupper(region) %in% toupper(filter_cities$name),
                !str_detect(region, "CASO SEM LOCALIZAÇÃO DEFINIDA"))

state_codes <- sort(unique(cases$region_code))

region_codes <- cases %>%
  dplyr::select(region, region_code) %>%
  unique()

#saveRDS(region_codes, "brazil/data/region_codes.rds")

cases <- cases %>%
  dplyr::select(-deaths) %>% 
  dplyr::rename(local = cases) %>%
  dplyr::mutate(imported = 0) %>%
  tidyr::gather(key = "import_status", value = "confirm", local, imported) %>% 
  tidyr::drop_na(region)


# Shared delay ------------------------------------------------------------

delay_defs <- readRDS("delays.rds")

# Set up cores -----------------------------------------------------
if (!interactive()){
  options(future.fork.enable = TRUE)
}

future::plan("multiprocess", workers = ncores)

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

EpiNow::regional_summary(results_dir = results_dir,
                         summary_dir = paste0(results_dir, "-summary"),
                         target_date = "latest",
                         region_scale = "Region")
#}
