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
library(shiny)
library(geotech)

shinyServer(function(input, output) {

#````````````````AASHOT soil claasification and Index
output$GC = renderText({
  AASHTO(sieve = input$sieve, size = input$size, percent = input$percent, metric = input$metric,
         p10 = input$p10, p40 = input$p40, p200 = input$p200,
         LL = input$LL, PL = input$PL, PI = input$PI, NP = input$NP)
})
  
output$GI = renderText({
  GI(p200=input$p200, LL=input$LL, PL = input$PL, PI = input$PI)
})


#```````Well Hydraulics`

output$wellFlow = renderText({
  wellFlow(k=input$k, H = input$H, h0=input$h0, hf=input$hf, r0 = input$r0, rw=input$rw)
})

output$wellDrawDown = renderPrint({
  
  wellDrawdown(Q=input$Q, k=input$k, H = input$H, h0=input$h0, r0=input$r0, rw=input$rw, r=input$r)
})


output$kPump = renderText({
  
  kPump(Q=input$Q, H = input$H, h1=input$h1, h2=input$h2, r1=input$r1, r2=input$r2) 
})


    
})