---
title: "National and Subnational estimates for Bahia, Brazil"
description: |
  Identifying changes in the reproduction number, rate of spread, and doubling time during the course of the COVID-19 outbreak whilst accounting for potential biases due to delays in case reporting both nationally and subnationally in Brazil These results are impacted by changes in testing effort, increases and decreases in testing effort will increase and decrease reproduction number estimates respectively (see Methods or our [paper](https://wellcomeopenresearch.org/articles/5-112/) for further explanation).
bibliography: library.bib
output:
  distill::distill_article:
    self_contained: true
categories:
  - "Subnational estimates"
  - "Americas"
---









*Using data available up to the:* 2020-07-18

*Note that it takes time for infection to cause symptoms, to get tested for SARS-CoV-2 infection, for a positive test to return and ultimately to enter the case data presented here. In other words, today’s case data are only informative of new infections about two weeks ago. This is reflected in the plots below, which are by date of infection.*

<div class="layout-chunk" data-layout="l-body">


</div>



<div class="layout-chunk" data-layout="l-body">


</div>


### Data availability

* Case counts by date, stratified by region were downloaded from a publicly available source [@NCoVUtils; @cota_monitoring_2020].
* Case onset dates were estimated using case counts by date of report and a distribution of reporting delays fitted to a publically available line-list of cases reported internationally [@kraemer2020epidemiological; @NCoVUtils].

### Limitations

* Line-list data to inform a region specific estimate of the reporting delay were not available.
* Regions are only included if at least 40 confirmed cases have been reported on a single day.

<div class="layout-chunk" data-layout="l-body">


</div>






### Summary of latest reproduction number and confirmed case count estimates by date of infection

<div class="layout-chunk" data-layout="l-body">
<img src="/home/gpu/mandacaru-sub9/covid-br-model-epiforecasts/_nowcasts/covid-regional/brazil/cities-ba-summary/summary_plot.png" width="95%" />

</div>


<br>
*Figure 4: Confirmed cases with date of infection on the 2020-07-07 and the time-varying estimate of the effective reproduction number (light bar = 90% credible interval; dark bar = the 50% credible interval.). Regions are ordered by the number of expected daily confirmed cases and shaded based on the expected change in daily confirmedcases. The horizontal dotted line indicates the target value of 1 for the effective reproduction no. required for control and a single case required for elimination.*

### Reproduction numbers over time in the six regions expected to have the most new confirmed cases

<div class="layout-chunk" data-layout="l-body-outset">
<img src="/home/gpu/mandacaru-sub9/covid-br-model-epiforecasts/_nowcasts/covid-regional/brazil/cities-ba-summary/high_cases_rt_plot.png" width="95%" />

</div>


<br>
*Figure 5: Time-varying estimate of the effective reproduction number (light ribbon = 90% credible interval; dark ribbon = the 50% credible interval) in the regions expected to have the highest number of new confirmed cases. Estimates from existing data are shown up to the 2020-07-07 from when forecasts are shown. These should be considered indicative only. Confidence in the estimated values is indicated by translucency with increased translucency corresponding to reduced confidence. The horizontal dotted line indicates the target value of 1 for the effective reproduction no. required for control. The vertical dashed line indicates the date of report generation.*

### Confirmed cases and their estimated date of infection in the six regions expected to have the most new confirmed cases

<div class="layout-chunk" data-layout="l-body-outset">
<img src="/home/gpu/mandacaru-sub9/covid-br-model-epiforecasts/_nowcasts/covid-regional/brazil/cities-ba-summary/high_cases_plot.png" width="95%" />

</div>


<br>
*Figure 6: Confirmed cases by date of report (bars) and their estimated date of infection (light ribbon = 90% credible interval; dark ribbon = the 50% credible interval) in the regions expected to have the highest number of new confirmed cases.  Estimates from existing data are shown up to the 2020-07-07 from when forecasts are shown. These should be considered indicative only. Confidence in the estimated values is indicated by translucency with increased translucency corresponding to reduced confidence. The vertical dashed line indicates the date of report generation.*

### Reproduction numbers over time in all regions

<div class="layout-chunk" data-layout="l-body-outset">
<img src="/home/gpu/mandacaru-sub9/covid-br-model-epiforecasts/_nowcasts/covid-regional/brazil/cities-ba-summary/rt_plot.png" width="95%" />

</div>


<br>
*Figure 7: Time-varying estimate of the effective reproduction number (light ribbon = 90% credible interval; dark ribbon = the 50% credible interval) in all regions. Estimates from existing data are shown up to the 2020-07-07 from when forecasts are shown. These should be considered indicative only. Confidence in the estimated values is indicated by translucency with increased translucency corresponding to reduced confidence. The horizontal dotted line indicates the target value of 1 for the effective reproduction no. required for control. The vertical dashed line indicates the date of report generation.*

### Confirmed cases and their estimated date of infection in all regions


<div class="layout-chunk" data-layout="l-body-outset">
<img src="/home/gpu/mandacaru-sub9/covid-br-model-epiforecasts/_nowcasts/covid-regional/brazil/cities-ba-summary/cases_plot.png" width="90%" />

</div>


*Figure 8: Confirmed cases by date of report (bars) and their estimated date of infection (light ribbon = 90% credible interval; dark ribbon = the 50% credible interval) in all regions. Estimates from existing data are shown up to the 2020-07-07 from when forecasts are shown. These should be considered indicative only. Confidence in the estimated values is indicated by translucency with increased translucency corresponding to reduced confidence. The vertical dashed line indicates the date of report generation.*

### Latest estimates (as of the 2020-07-07)


*Table 2: Latest estimates (as of the 2020-07-07) of the number of confirmed cases by date of infection, the effective reproduction number, and the doubling time (when negative this corresponds to the halving time) in each region. The mean and 90% credible interval is shown.*
<br>
<div class="layout-chunk" data-layout="l-body-outset">
<table>
 <thead>
  <tr>
   <th style="text-align:left;"> Region </th>
   <th style="text-align:left;"> New confirmed cases by infection date </th>
   <th style="text-align:left;"> Expected change in daily cases </th>
   <th style="text-align:left;"> Effective reproduction no. </th>
   <th style="text-align:left;"> Doubling/halving time (days) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> BA-Alagoinhas </td>
   <td style="text-align:left;"> 33 (23 -- 43) </td>
   <td style="text-align:left;"> Unsure </td>
   <td style="text-align:left;"> 1 (0.8 -- 1.3) </td>
   <td style="text-align:left;"> 140 (9.5 -- -11) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Araci </td>
   <td style="text-align:left;"> 20 (12 -- 28) </td>
   <td style="text-align:left;"> Unsure </td>
   <td style="text-align:left;"> 1.1 (0.8 -- 1.4) </td>
   <td style="text-align:left;"> 29 (5.9 -- -10) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Barreiras </td>
   <td style="text-align:left;"> 31 (21 -- 42) </td>
   <td style="text-align:left;"> Likely increasing </td>
   <td style="text-align:left;"> 1.2 (0.9 -- 1.4) </td>
   <td style="text-align:left;"> 18 (6.2 -- -21) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Camacan </td>
   <td style="text-align:left;"> 22 (12 -- 30) </td>
   <td style="text-align:left;"> Likely increasing </td>
   <td style="text-align:left;"> 1.3 (0.9 -- 1.6) </td>
   <td style="text-align:left;"> 12 (4.6 -- -17) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Camaçari </td>
   <td style="text-align:left;"> 94 (73 -- 108) </td>
   <td style="text-align:left;"> Likely increasing </td>
   <td style="text-align:left;"> 1.1 (0.9 -- 1.2) </td>
   <td style="text-align:left;"> 26 (10 -- -46) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Camamu </td>
   <td style="text-align:left;"> 22 (13 -- 29) </td>
   <td style="text-align:left;"> Unsure </td>
   <td style="text-align:left;"> 1 (0.7 -- 1.3) </td>
   <td style="text-align:left;"> -120 (9.3 -- -8.2) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Campo Formoso </td>
   <td style="text-align:left;"> 21 (12 -- 30) </td>
   <td style="text-align:left;"> Likely increasing </td>
   <td style="text-align:left;"> 1.2 (0.9 -- 1.6) </td>
   <td style="text-align:left;"> 15 (5.1 -- -16) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Candeias </td>
   <td style="text-align:left;"> 28 (18 -- 38) </td>
   <td style="text-align:left;"> Unsure </td>
   <td style="text-align:left;"> 1 (0.7 -- 1.2) </td>
   <td style="text-align:left;"> -37 (13 -- -7.7) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Conceição do Coité </td>
   <td style="text-align:left;"> 25 (13 -- 35) </td>
   <td style="text-align:left;"> Unsure </td>
   <td style="text-align:left;"> 1.1 (0.8 -- 1.4) </td>
   <td style="text-align:left;"> 25 (6.1 -- -12) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Eunápolis </td>
   <td style="text-align:left;"> 36 (24 -- 46) </td>
   <td style="text-align:left;"> Unsure </td>
   <td style="text-align:left;"> 1.1 (0.9 -- 1.3) </td>
   <td style="text-align:left;"> 25 (7.4 -- -18) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Feira de Santana </td>
   <td style="text-align:left;"> 112 (95 -- 131) </td>
   <td style="text-align:left;"> Likely decreasing </td>
   <td style="text-align:left;"> 0.9 (0.8 -- 1) </td>
   <td style="text-align:left;"> -25 (100 -- -11) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Gandu </td>
   <td style="text-align:left;"> 26 (17 -- 36) </td>
   <td style="text-align:left;"> Unsure </td>
   <td style="text-align:left;"> 1 (0.7 -- 1.3) </td>
   <td style="text-align:left;"> 340 (8.6 -- -9.2) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Ilhéus </td>
   <td style="text-align:left;"> 50 (35 -- 61) </td>
   <td style="text-align:left;"> Unsure </td>
   <td style="text-align:left;"> 1 (0.8 -- 1.2) </td>
   <td style="text-align:left;"> 95 (11 -- -15) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Itaberaba </td>
   <td style="text-align:left;"> 18 (9 -- 25) </td>
   <td style="text-align:left;"> Unsure </td>
   <td style="text-align:left;"> 1.2 (0.8 -- 1.5) </td>
   <td style="text-align:left;"> 16 (5 -- -13) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Itabuna </td>
   <td style="text-align:left;"> 73 (54 -- 88) </td>
   <td style="text-align:left;"> Unsure </td>
   <td style="text-align:left;"> 0.9 (0.8 -- 1.1) </td>
   <td style="text-align:left;"> -49 (23 -- -12) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Itamaraju </td>
   <td style="text-align:left;"> 19 (10 -- 27) </td>
   <td style="text-align:left;"> Unsure </td>
   <td style="text-align:left;"> 1 (0.6 -- 1.3) </td>
   <td style="text-align:left;"> -61 (8.7 -- -6.7) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Itapetinga </td>
   <td style="text-align:left;"> 28 (16 -- 37) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.4 (1.1 -- 1.8) </td>
   <td style="text-align:left;"> 6.9 (3.7 -- 38) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Jaguaquara </td>
   <td style="text-align:left;"> 29 (17 -- 37) </td>
   <td style="text-align:left;"> Unsure </td>
   <td style="text-align:left;"> 1.1 (0.8 -- 1.3) </td>
   <td style="text-align:left;"> 69 (8 -- -11) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Jequié </td>
   <td style="text-align:left;"> 81 (65 -- 96) </td>
   <td style="text-align:left;"> Likely increasing </td>
   <td style="text-align:left;"> 1.1 (0.9 -- 1.3) </td>
   <td style="text-align:left;"> 38 (11 -- -27) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Juazeiro </td>
   <td style="text-align:left;"> 53 (38 -- 66) </td>
   <td style="text-align:left;"> Unsure </td>
   <td style="text-align:left;"> 1 (0.8 -- 1.1) </td>
   <td style="text-align:left;"> -89 (16 -- -12) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Lauro de Freitas </td>
   <td style="text-align:left;"> 74 (55 -- 89) </td>
   <td style="text-align:left;"> Decreasing </td>
   <td style="text-align:left;"> 0.9 (0.7 -- 1) </td>
   <td style="text-align:left;"> -23 (60 -- -9.7) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Luís Eduardo Magalhães </td>
   <td style="text-align:left;"> 25 (15 -- 33) </td>
   <td style="text-align:left;"> Unsure </td>
   <td style="text-align:left;"> 1.1 (0.8 -- 1.4) </td>
   <td style="text-align:left;"> 27 (6.4 -- -12) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Porto Seguro </td>
   <td style="text-align:left;"> 36 (24 -- 46) </td>
   <td style="text-align:left;"> Unsure </td>
   <td style="text-align:left;"> 1.1 (0.8 -- 1.3) </td>
   <td style="text-align:left;"> 26 (7.5 -- -18) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Presidente Tancredo Neves </td>
   <td style="text-align:left;"> 26 (16 -- 35) </td>
   <td style="text-align:left;"> Likely increasing </td>
   <td style="text-align:left;"> 1.2 (0.9 -- 1.5) </td>
   <td style="text-align:left;"> 14 (5.3 -- -22) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Salvador </td>
   <td style="text-align:left;"> 527 (474 -- 576) </td>
   <td style="text-align:left;"> Decreasing </td>
   <td style="text-align:left;"> 0.9 (0.8 -- 0.9) </td>
   <td style="text-align:left;"> -20 (-39 -- -13) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Santo Antônio de Jesus </td>
   <td style="text-align:left;"> 31 (19 -- 40) </td>
   <td style="text-align:left;"> Unsure </td>
   <td style="text-align:left;"> 1.1 (0.8 -- 1.3) </td>
   <td style="text-align:left;"> 41 (8 -- -13) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-São Sebastião do Passé </td>
   <td style="text-align:left;"> 17 (9 -- 24) </td>
   <td style="text-align:left;"> Unsure </td>
   <td style="text-align:left;"> 1.1 (0.7 -- 1.5) </td>
   <td style="text-align:left;"> 29 (5.7 -- -9.2) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Simões Filho </td>
   <td style="text-align:left;"> 25 (14 -- 33) </td>
   <td style="text-align:left;"> Unsure </td>
   <td style="text-align:left;"> 1.1 (0.8 -- 1.4) </td>
   <td style="text-align:left;"> 25 (6.3 -- -13) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Teixeira de Freitas </td>
   <td style="text-align:left;"> 41 (28 -- 51) </td>
   <td style="text-align:left;"> Unsure </td>
   <td style="text-align:left;"> 1 (0.8 -- 1.2) </td>
   <td style="text-align:left;"> -110 (13 -- -11) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Vitória da Conquista </td>
   <td style="text-align:left;"> 46 (32 -- 59) </td>
   <td style="text-align:left;"> Unsure </td>
   <td style="text-align:left;"> 1.1 (0.9 -- 1.3) </td>
   <td style="text-align:left;"> 31 (8.4 -- -19) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BA-Wenceslau Guimarães </td>
   <td style="text-align:left;"> 22 (13 -- 29) </td>
   <td style="text-align:left;"> Likely increasing </td>
   <td style="text-align:left;"> 1.3 (0.9 -- 1.7) </td>
   <td style="text-align:left;"> 9.2 (4.2 -- -50) </td>
  </tr>
</tbody>
</table>

</div>


<div class="layout-chunk" data-layout="l-body">


</div>




