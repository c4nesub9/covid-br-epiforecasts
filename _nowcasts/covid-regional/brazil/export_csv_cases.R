library(dplyr)

args <- commandArgs(TRUE)

results_dirs <- args

for (results_dir in args) {
  print(paste("exporting at", results_dir))
  output_csv <- file.path(results_dir, "case_nowcast_forecast.csv")
  
  summarised_nowcast <- file.path(results_dir, "summarised_nowcast.rds") %>%
    readRDS() %>%
    filter(type == "nowcast") %>%
    select(-confidence)
  
  case_forecast <- file.path(results_dir, "case_forecast.rds") %>%
    readRDS() %>%
    select(-std, -range, -type) %>%
    rename(type = rt_type)
  
  summarised_nowcast %>%
    bind_rows(case_forecast) %>%
    write.csv(output_csv, row.names = FALSE)  
}




