#_______________________________________________________________________________________________________________________#
# Programe for Development of Data Science & Analytics Application for Geotechnical Engineering                         #
# Name                :::: yoana™ 2.0 DAS_PAHARMACOVIGILANCE                                                            #
# Client              :::: Mining Companies                                                                             #
# Version             :::: 1                                                                                            #
# Author/Developer    :::: Kwaku Damoah, Chief Data Scientist, kdalgo Company Limited                                   #
# Company             :::: kdalgo (Kwaku Damoah algorithms)                                                             #
# Directory           :::: /Users/kdalgo/Dropbox/GeoTech                                                                #
# Startdate           :::: 29th December 2017                                                                           #
# Enddate             :::: 31st December 2017                                                                           #
# Contacts            :::: kdamoah@kdalgo.net, @kd_algo, @KwakuDamoah, kdamoah.wordpress.com, www.kdalgo.net            #
#_______________________________________________________________________________________________________________________#
#Sys.timezone(location = TRUE)
Sys.setenv(TZ='GMT')

library(geotech)
library(GeoRiskR)  ##data for reliability study of geotechnical engineering
#library(petro.One)
library(rgr)
library(QoLR)
library(PROscorer)

#``````````````````````````````````````````````````````````````````````````````
#          geotech
#``````````````````````````````````````````````````````````````````````````````


## Example code for AASHTO group classification
AASHTO(p10 = 51, p40 = 30, p200 = 150, LL = 40, PI = 10)
## Example code for AASHTO group index
GI(p200 = 48, LL = 45, PI = 21)
## Example code for Flow rate to well
wellFlow(k = 0.065, H = 10, h0 = 21, hf = 15, r0 = 20, rw = 2)
## Example code for Well Drawdown
wellDrawdown(Q = 14.5, k = 0.065, H = 10, h0 = 21, r0 = 20, r = 2, rw = 2)
## Example code for Hydraulic Conductivity from pumping tests
kPump(Q = 14.5, H = 10, h1 = 20, h2 = 16, r1 = 16, r2 = 8)

#``````````````````````````````````````````````````````````````````````````````
#          rgr
#``````````````````````````````````````````````````````````````````````````````

## Make test data available
data(ad.test)
attach(ad.test)
## Plot analytical duplicate analyses as a time-series
ad.plot2(Cu, ifalt = TRUE)
## Plot analytical duplicate analyses versus duplicate means,
## annotating more appropriately, with a 20% maximum tolerance
ad.plot2(Cu, "Cu (mg/kg)", if.order = FALSE, ad.tol = 20, ifalt = TRUE)
## Detach test data
detach(ad.test)


## Make test data available
data(ad.test)
attach(ad.test)
## Plot analytical duplicate analyses as ratios in acquistion sequence
ad.plot4(Cu, ifalt = TRUE)
## Plot analytical duplicate analysis ratios against their means with
## more informative annotation
ad.plot4(Cu, "Cu (mg/kg)", ifalt = TRUE, if.order = FALSE)
## Plot analytical duplicate analysis ratios against their means with a
## CPP of the ratios and more informative annotation
ad.plot4(Cu, "Cu (mg/kg)", ifalt = TRUE, if.order = FALSE, if.cpp = TRUE)
## Detach test data
detach(ad.test)

## Make test data available
data(kola.c)
attach(kola.c)
## Display a simple box-and-whisker plot
bwplots(Cu, by = COUNTRY)
bwplots(split(Cu,COUNTRY))
## Display a more appropriately labelled and scaled box-and-whisker plot
bwplots(Cu, by = COUNTRY, log = TRUE, xlab = "Country",
        ylab = "Cu (mg/kg) in <2 mm C-horizon soil")
## Display a west-to-east re-ordered plot using the full country names
bwplots(split(Cu, COUNTRY), log = TRUE,
        ylab = "Cu (mg/kg) in <2 mm C-horizon soil",
        label = c("Finland", "Norway", "Russia"),
        plot.order = c(2, 1, 3))
## Detach test data
detach(kola.c)
## Make test data kola.o available, setting a -9999, indicating a
## missing pH measurement, to NA
data(kola.o)
kola.o.fixed <- ltdl.fix.df(kola.o, coded = -9999)
attach(kola.o.fixed)
## Display relationship between pH in one pH unit intervals and Cu in
## O-horizon (humus) soil, extending the whiskers to the 2nd and 98th
## percentiles
bwplots(split(Cu,trunc(pH+0.5)), log = TRUE, wend = 0.02,
        xlab = "O-horizon soil pH to the nearest pH unit",
        ylab = "Cu (mg/kg) in <2 mm Kola O-horizon soil")
## As above, but demonstrating the use of variable box widths and the
## suppression of 95% confidence interval notches.  The box widths are
## computed as (Log10(n)+0.1)/5, the 0.1 is added as one subset has a
## population of 1.  Note: paste is used in constructing xlab, below,
## as the label is long and overflows the text line length
table(trunc(pH+0.5))
bwplots(split(Cu,trunc(pH+0.5)), log=TRUE, wend = 0.02, notch = FALSE,
        xlab = paste("O-horizon soil pH to the nearest pH unit,",
                     "\nbox widths proportional to Log(subset_size)"),
        ylab = "Cu (mg/kg) in <2 mm Kola O-horizon soil",
        width = c(0.26, 0.58, 0.24, 0.02))
## Detach test data
detach(kola.o.fixed)
data(triples.test1)

#``````````````````````````````````````````````````````````````````````````````
#          PROscorer
#``````````````````````````````````````````````````````````````````````````````

dat <- PROscorerTools::makeFakeData(n = 20, nitems = 30, values = 1:4, id = TRUE)
dat
c30scores <- qlq_c30(dat, 'q')
c30scores

#``````````````````````````````````````````````````````````````````````````````
#          QoLR
#``````````````````````````````````````````````````````````````````````````````
data(dataqol)
head(dataqol)
score_dataqol=scoring.QLQC30(dataqol,id="Id", time="time")
head(round(score_dataqol))
info=dataqol[,c("Id","time","date","death","Arm")]
dataqol_final=merge(score_dataqol,info,by=c("Id","time"))
dataqol_final=dataqol_final[,c(1:2,18,3:17,19:20)]
head(round(dataqol_final))
dataqol_final=dataqol_final[order(dataqol_final$time),]
dataqol_final=dataqol_final[order(dataqol_final$Id),]
head(round(dataqol_final))
