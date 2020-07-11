# covid-br-model-epiforecasts

Este repositório contém resultados da execução do modelo do [EpiForecasts](https://epiforecasts.io), que tem o código disponível em https://github.com/epiforecasts/covid.

Nós apresentados resultados de nowcast e forecast de novos casos, novos óbitos, taxa de reprodução efetiva (Rt) para estados do Brasil e cidades do Nordeste.

# Relatórios

- [Casos: estados do Brasil](posts/national/brazil/brazil.html)
- [Casos: cidades do Nordeste do Brasil](posts/national/ne_cities/ne_cities.html)
- [Óbitos: estados do Brasil](posts/national/deaths_brazil/deaths_brazil.html)
- [Óbitos: cidades do Nordeste do Brasil](posts/national/deaths_ne_cities/deaths_ne_cities.html)

## Requisitos

- [R 4.0+](https://cran.r-project.org/)
- `libcurl4-openssl-dev`
- `libv8-dev`
- `libxml2-dev`
- `libssl-dev`
- `libudunits2-dev`
- `libgdal-dev`
- `libfontconfig1-dev`

### Instalação de pacotes R

```
Rscript install_packages.R
```
