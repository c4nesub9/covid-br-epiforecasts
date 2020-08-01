library(dplyr)

args <- commandArgs(TRUE)

results_dir <- args[1]
results_dir <- gsub("/$", "", results_dir) # remove trailing slash

summary_dir <- paste0(results_dir, "-summary")
  
regions <- list.files(results_dir)

cases_all <- tibble()
rt_all <- tibble()

for (region in regions) {
  res_dir <- file.path(results_dir, region, "latest")
  output_cases_csv <- file.path(res_dir, "cases_nowcast_forecast.csv")
  output_rt_csv <- file.path(res_dir, "rt_nowcast_forecast.csv")
  print(paste("exporting at", output_cases_csv, "and", output_rt_csv))
  
  summarised_nowcast <- file.path(res_dir, "summarised_nowcast.rds") %>%
    readRDS() %>%
    #filter(type == "nowcast") %>%
    mutate(type = ifelse(type == "Observed by report date", "observed",
                         type)) %>%
    select(date:mean)
  
  cases_forecast <- file.path(res_dir, "case_forecast.rds") %>%
    readRDS() %>%
    select(date:mean) %>%
    rename(type = rt_type)
  
  cases <- summarised_nowcast %>%
    bind_rows(cases_forecast) %>%
    mutate(region) %>%
    select(region, everything())

  write.csv(cases, output_cases_csv, row.names = FALSE)
  
  cases_all <- bind_rows(cases_all, cases)
  
  rt <- file.path(res_dir, "summarised_reff.rds") %>%
    readRDS() %>%
    mutate(region) %>%
    select(region, date:prob_control) %>%
    rename(type = rt_type)
  
  write.csv(rt, output_rt_csv, row.names = FALSE)
  
  rt_all <- bind_rows(rt_all, rt)
}

output_cases_summary_csv <- file.path(summary_dir, "cases_nowcast_forecast.csv")
output_rt_summary_csv <- file.path(summary_dir, "rt_nowcast_forecast.csv")
write.csv(cases_all, output_cases_summary_csv, row.names = FALSE)
write.csv(rt_all, output_rt_summary_csv, row.names = FALSE)

output_summary_table_csv <- file.path(summary_dir, "summary_table.csv")
summary_table <- file.path(summary_dir, "summary_table.rds") %>%
  readRDS()
write.csv(summary_table, output_summary_table_csv, row.names = FALSE)

output_summary_data_csv <- file.path(summary_dir, "summary_data.csv")
summary_data <- file.path(summary_dir, "summary_data.rds") %>%
  readRDS()
write.csv(summary_data, output_summary_data_csv, row.names = FALSE)

print(paste("exporting summary at", output_cases_summary_csv,
            output_rt_summary_csv, output_summary_table_csv,
            "and", output_summary_data_csv))
