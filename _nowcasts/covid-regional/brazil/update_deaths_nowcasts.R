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

results_dir <- ifelse(len(argv) >= 1, argv[1], "brazil/deaths-regional")
results_dir <- gsub("/$", "", results_dir) # remove trailing slash

# Get deaths ---------------------------------------------------------------

deaths <- NCoVUtils::get_brazil_regional_cases(geography = "states") %>%
  dplyr::ungroup() %>%
  dplyr::rename(region = state_name, region_code = state_code) 


region_codes <- deaths %>%
  dplyr::select(region, region_code) %>%
  unique()

saveRDS(region_codes, "brazil/data/region_codes.rds")

deaths <- deaths %>%
  dplyr::select(-cases, -region_code) %>% 
  dplyr::rename(local = deaths) %>%
  dplyr::mutate(imported = 0) %>%
  tidyr::gather(key = "import_status", value = "confirm", local, imported) %>% 
  tidyr::drop_na(region)


# Get delay to death -----------------------------------------------------

delay_defs <- readRDS("brazil/data/onset_to_death_delay.rds")

# Get the incubation period -----------------------------------------------

## Mean delay
exp(EpiNow::covid_incubation_period[1, ]$mean)

## Get incubation defs
incubation_defs <- EpiNow::lognorm_dist_def(mean = EpiNow::covid_incubation_period[1, ]$mean,
                                            mean_sd = EpiNow::covid_incubation_period[1, ]$mean_sd,
                                            sd = EpiNow::covid_incubation_period[1, ]$sd,
                                            sd_sd = EpiNow::covid_incubation_period[1, ]$sd_sd,
                                            max_value = 30, samples = 1000)

# Set up cores -----------------------------------------------------
if (!interactive()){
  options(future.fork.enable = TRUE)
}

cores_per_region <- 1
future::plan(list(future::tweak("multiprocess", workers = round(future::availableCores() / cores_per_region)),
                  future::tweak("multiprocess", workers = cores_per_region)), gc = TRUE, earlySignal = TRUE)

# Run pipeline ----------------------------------------------------

EpiNow::regional_rt_pipeline(
  cases = deaths,
  delay_defs = delay_defs,
  incubation_defs = incubation_defs,
  target_folder = results_dir, 
  case_limit = 10,
  min_forecast_cases = 50,
  horizon = 14,
  nowcast_lag = 9 + 5, # Delay from death -> onset + onset -> infection
  approx_delay = TRUE,
  report_forecast = TRUE, 
  forecast_model = function(y, ...){EpiSoon::forecastHybrid_model(
    y = y[max(1, length(y) - 21):length(y)],
    model_params = list(models = "aefz", weights = "equal"),
    forecast_params = list(PI.combination = "mean"), ...)}
)

future::plan("sequential")

# Summarise results -------------------------------------------------------

EpiNow::regional_summary(results_dir = results_dir,
                         summary_dir = paste0(results_dir, "-summary"),
                         target_date = "latest",
                         region_scale = "Region",
                         csv_region_label = "region",
                         log_cases = TRUE)
