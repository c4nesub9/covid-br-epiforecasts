argv <- commandArgs(TRUE)

results_dir <- ifelse(length(argv) >= 1, argv[1], "brazil/regional")
summary_dir <- ifelse(length(argv) >= 2, argv[2], paste0(results_dir, "-summary"))
target_date <- ifelse(length(argv) >= 3, argv[3], "latest")
region_scale <- ifelse(length(argv) >= 4, argv[4], "Region")

EpiNow::regional_summary(results_dir = results_dir,
                         summary_dir = summary_dir,
                         target_date = target_date,
                         region_scale = region_scale)