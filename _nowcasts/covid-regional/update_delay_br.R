
# Packages ----------------------------------------------------------------

require(data.table, quietly = TRUE)
require(dplyr, quietly = TRUE)
require(EpiNow, quietly = TRUE)
require(lubridate, quietly = TRUE)
require(RMySQL, quietly = TRUE)

# Update linelist from DB

#credenciais
.user='mandacaru'
.password='Covid2019Br'
.dbname='db_covid19brio'
.host='200.238.145.116'
.port=3306

#conectando ao banco
mydrv <- dbDriver("MySQL")
con <- dbConnect(mydrv, user=.user, password=.password, dbname=.dbname, host=.host, port=.port)
dbSendQuery(con, 'set character set "utf8"')

regioes_tbl <- tbl(con, "regioes")
estados_tbl <- tbl(con, "estados")
municipios_tbl <- tbl(con, "municipios")
sg_tbl <- tbl(con, "mun_sg")

sg <- sg_tbl %>%
  left_join(municipios_tbl, by = c("municipio_id" = "id"),
            suffix = c("", "_municipio")) %>%
  left_join(estados_tbl, by = c("estado_id" = "id"),
            suffix = c("", "_estado")) %>%
  left_join(regioes_tbl, by = c("regiao_id" = "id"),
            suffix = c("", "_regiao"))

linelist_br <- sg %>%
  filter(!is.na(classificacao_final),
         classificacao_final != "Descartado",
         classificacao_final != "Síndrome Gripal Não Especificada") %>%
  select(regiao = nome_regiao,
         estado = abrev,
         tipo_teste,
         data_inicio_sint,
         data_notificacao,
         data_teste,
         data_encerramento) %>%
  collect() %>%
  mutate_at(vars(starts_with("data_")), as_date)

write.csv(linelist_br, gzfile("linelist_br.csv.gz"), row.names = FALSE)

 # Get linelist ------------------------------------------------------------

#linelist <- 
#  data.table::fread("https://raw.githubusercontent.com/epiforecasts/NCoVUtils/master/data-raw/linelist.csv")

delays <- linelist_br %>%
  filter(!is.na(data_encerramento)) %>%
  transmute(report_delay = as.numeric(data_encerramento - data_inicio_sint)) %>%
  pull(report_delay)

summary(delays)

# Set up cores -----------------------------------------------------
if (!interactive()){
  options(future.fork.enable = TRUE)
}

future::plan("multiprocess", workers = round(future::availableCores()))


# Fit the reporting delay -------------------------------------------------

delay_defs <- EpiNow::get_dist_def(delays, 
                                   bootstraps = 100, samples = 100)
#                                   bootstraps = 100, samples = 1000)

saveRDS(delay_defs, "delays.rds")
