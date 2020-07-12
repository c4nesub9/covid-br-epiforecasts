library(dplyr)

args <- commandArgs(TRUE)

results_dir <- args[1]
results_dir <- gsub("/$", "", results_dir) # remove trailing slash

summary_dir <- paste0(results_dir, "-summary")
  
regions <- list.files(results_dir)

res_df_all <- tibble()

for (region in regions) {
  res_dir <- file.path(results_dir, region, "latest")
  output_csv <- file.path(res_dir, "case_nowcast_forecast.csv")
  print(paste("exporting at", output_csv))
  
  summarised_nowcast <- file.path(res_dir, "summarised_nowcast.rds") %>%
    readRDS() %>%
    filter(type == "nowcast") %>%
    select(-confidence)
  
  case_forecast <- file.path(res_dir, "case_forecast.rds") %>%
    readRDS() %>%
    select(-std, -range, -type) %>%
    rename(type = rt_type)
  
  res_df <- summarised_nowcast %>%
    bind_rows(case_forecast) %>%
    mutate(region)
  
  write.csv(res_df, output_csv, row.names = FALSE)
  
  res_df_all <- bind_rows(res_df_all, res_df)
}

output_summary_csv <- file.path(summary_dir, "case_nowcast_forecast.csv")
print(paste("exporting summary at", output_summary_csv))
write.csv(res_df_all, output_summary_csv, row.names = FALSE)
