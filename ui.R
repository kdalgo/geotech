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
Sys.timezone(location = TRUE)
Sys.setenv(TZ='GMT')

library(shiny)


#Generate the User Interface of the Application
ui= shinyUI(navbarPage(tags$h4("yoana™ 2.0 ::: AUTOMATION & ANALYTICS FOR GEOTECHNICAL CALCULATIONS AND VISUALIZATIONS"
                               ,style='color:navy'),
   header =tags$img(src = "qt.gif", height = 35, width = 30, align="left",
                    tags$strong(tags$h4('kdalgo',style='color:midnightblue', align="left")), tags$hr()),
   collapsible = T,
   footer =  tags$b(tags$h4('Analytics and Automation for Insights & Visualization',
                            style='color:blue', align="center", tags$hr(),
                            tags$h4('by kdalgo™, for further info and help :', align='center',style='color:coral',
                                    
                                    tags$a(href='mailto:info@kdalgo.net', 'email',align="center",style='color:midnightblue'),    
                                    tags$a(href='https://www.kdalgo.net/', 'www',align="center",style='color:red'),
                                    tags$a(href='https://kdamoah.wordpress.com', 'blogs',align="center",style='color:brown'),
                                    tags$a(href="https://twitter.com/kd_algo",'twitter', align="center",style='color:green')),
                            tags$hr())),
   position = c('fixed-top'),
   windowTitle = "yoana™ 2.0 GeoTech",
   theme = 'united.css', inverse = F,
   tags$hr(), #tags$hr(),
   

navbarMenu("SOIL",
           tabPanel("AASHTO Soil Group Classification and Index",
                    #h3("AASHTO Soil Clsaaification"),
                    br(),
                helpText("This set of functions classifies soil using the American Association of State Highway and 
                      Transportation Officials (AASHTO) Soil Classification System.", align="center",style='color:green'),
                br(),
                    fluidRow(
                      column(11,
                             tags$h4(tags$b("AASHTO Soil Group Classification and Index",
                                            align="center", style='color:coral')))),
                    
                    fluidRow(
                      
                      column(3,
                             helpText("Vector of sieve numbers (according to ASTM D422) in grain-size distribution",
                                      hr(),
                               numericInput("sieve", "Select Sieve Number:", NA, min = 1, max = NA, step = 1)
                             )),
                      column(3,
                             helpText("Vector of grain sizes (in or mm) in distribution",
                                      hr(),
                                       numericInput("size", "Select Grain Size:", NA, min = 1, max = NA, step = 1)
                             )),
                      column(3,
                             helpText("Vector of percent passing in grain-size distribution",
                                      hr(),
                                       numericInput("percent", "Select Percentage Passing:", NA, min = 0, max = 100, step = 0.01)
                             )),
                      column(3,
                             helpText("Logical variable for grain-size distribution: TRUE for metric units (mm), FALSE
                                      for English units (in); only required if size is supplied",
                                      hr(),
                                       selectInput("metric", 
                                          label="Select TRUE (mm) or FALSE (in):",
                                          choices = c(NA, TRUE, FALSE),
                                          selected = NA,
                                          multiple = FALSE
                                   
                                  )
                             ))
                      
                      ),
                hr(),
                fluidRow(
                  
                  column(4,
                         helpText("Percent passing #10 sieve",
                                  hr(),
                                  numericInput("p10", "Select P10:", 51, min = 0, max = 100, step = 0.01)
                         )),
                  column(4,
                         helpText("Percent passing #40 sieve",
                                  hr(),
                                  numericInput("p40", "Select P40:", 30, min = 0, max = 100, step = 0.01)
                         )),
                  column(4,
                         helpText("Percent passing #200 sieve",
                                  hr(),
                                  numericInput("p200", "Select P200:", 15, min = 0, max = 100, step = 0.01)
                         ))
                  
                ),
                hr(),
                fluidRow(
                  
                  column(3,
                         helpText("liquid limit (percent)",
                                  hr(),
                                  numericInput("LL", "Select liquid limit (percent):", 40, min = 0, max = 100, step = 0.01)
                         )),
                  column(3,
                         helpText("Plastic limit (percent)",
                                  hr(),
                                  numericInput("PL", "Select plastic limit (percent):", 25, min = 0, max = 100, step = 0.01)
                         )),
                  column(3,
                         helpText("Plasticity index (percent)",
                                  hr(),
                                  numericInput("PI", "Select plasticity index (percent):", 10, min = 0, max = 100, step = 0.01)
                         )),
                  column(3,
                         helpText("logical variable indicating whether the soil is nonplastic (TRUE or FALSE)",
                                  hr(),
                                  selectInput("NP", 
                                              label="Select TRUE or FALSE:",
                                              choices = c(NA, TRUE, FALSE),
                                              selected = NA,
                                              multiple = FALSE
                                              
                                  )
                         ))
                  
                ),
                hr(), hr(), hr(),
                
                fluidRow(
                  column(6,
                         wellPanel("AASHTO Group Classification",
                                   verbatimTextOutput("GC"))
                         ),
                  column(6,
                         wellPanel("AASHTO Group Index",
                                   verbatimTextOutput("GI"))
                         )
                )
                
            ),  
           
           
           
           
           tabPanel("USCS Soil Classification"),
           tabPanel("Grain Size Distribution Function"),
           tabPanel("Phase Diagrams and Index Parameters"),
           tabPanel("Standard Penetration Test (SPT) Corrected N-values"),
           tabPanel("Plasticity Functions"),
           tabPanel("Plot of Soil Profile")
           ),           
navbarMenu("BEARING CAPACITY & PRESSURE",
          tabPanel("Ultimate Bearing Capacity"),
          tabPanel("Bearing Capacity Factors"),
          tabPanel("Bearing Pressure")
),

navbarMenu("STRESS CALCULATIONS",
          tabPanel("Horizontal Stress Calculations"),
          tabPanel("Induced Stress due to Area Loads"),
          tabPanel("Induced Stress due to Point Loads"),
          tabPanel("Plot of Stress Profile"),
          tabPanel("Vertical Stress Calculations"),
          tabPanel("Mohr Circle Calculations"),
          tabPanel("Lateral Earth Pressures")
),
navbarMenu("WELL HYDRAULICS",
        tabPanel("Well Hydraulics",
                 helpText("These functions are used to calculate flow rate to wells (wellFlow), drawdown to wells (wellDrawdown),
                           and hydraulic conductivity from pumping tests (kPump).", align="center",style='color:green'),
                 br(),
                 fluidRow(
                   column(11,
                          tags$h4(tags$b("Well Hydraulics",
                                         align="center", style='color:coral')))),
                 
                 fluidRow(
                   
                   column(3,
                          helpText("Flow rate into well",
                                   hr(),
                                   numericInput("Q", "Select flow rate into well-Q:", 14.5, min = 1, max = NA, step = 0.01)
                          )),
                   column(3,
                          helpText("hydraulic conductivity of aquifer",
                                   hr(),
                                   numericInput("k", "Select hydraulic conductivity of aquifer-k:", 0.065, min = 0, max = NA, step = 0.01)
                          )),
                   column(3,
                          helpText("thickness of aquifer",
                                   hr(),
                                   numericInput("H", "Select thickness of aquifer-H:", 10, min = 0, max = NA, step = 0.01)
                          )),
                   column(3,
                          helpText("initial total head in aquifer (before pumping)",
                                   hr(),
                                   numericInput("h0", "Select initial total head-h0:", 21, min = 0, max = 100, step = 0.01) 
                          ))
                   
                 ),
                 hr(),
                 fluidRow(
                   
                   column(3,
                          helpText("final total head in well casing (after pumping)",
                                   hr(),
                                   numericInput("hf", "Select final total head-hf:", 15, min = 0, max = 100, step = 0.01)
                          )),
                   column(3,
                          helpText("radius of influence",
                                   hr(),
                                   numericInput("r0", "Select radius of influence-r0:", 20, min = 0, max = NA, step = 0.01)
                          )),
                   column(3,
                          helpText("radius of well",
                                   hr(),
                                   numericInput("rw", "Select radius of well-rw:", 2, min = 0, max = NA, step = 0.01)
                          )),
                   column(3,
                          helpText("radius of interest (for drawdown calculations)",
                                   hr(),
                                   numericInput("r", "Selectradius of interest-r:", 2, min = 0, max = 100, step = 0.01)
                          ))
                   
                 ),
                 hr(),
                 fluidRow(
                   
                   column(3,
                          helpText("total head in farthest observation well (kPump)",
                                   hr(),
                                   numericInput("h1", "Select total head-Farthest-h1:", 20, min = 0, max = NA, step = 0.01)
                          )),
                   column(3,
                          helpText("total head in nearest observation well (kPump)",
                                   hr(),
                                   numericInput("h2", "Select total head-Nearest-h2:", 16, min = 0, max = NA, step = 0.01)
                          )),
                   column(3,
                          helpText("radius from pumped well to farthest observation well (kPump))",
                                   hr(),
                                   numericInput("r1", "Select radius-r1:", 16, min = 0, max = NA, step = 0.01)
                          )),
                   column(3,
                          helpText("radius from pumped well to nearest observation well (kPump)",
                                   hr(),
                                   numericInput("r2", "Select radius-r2:", 8, min = 0, max = NA, step = 0.01)
                          ))
                   
                 ),
                 hr(), hr(), hr(),
                 
                 fluidRow(
                   column(4,
                          wellPanel("Well Flow",
                                    verbatimTextOutput("wellFlow"))
                   ),
                   column(4,
                          wellPanel("Well Drawdown",
                                    verbatimTextOutput("wellDrawDown"))
                   ),
                   column(4,
                          wellPanel("kPump",
                                    verbatimTextOutput("kPump"))
                   )
                 )
)



       # tabPanel("Hydraulic Conductivity")
),

navbarMenu("SAFETY",
           tabPanel("Slope Stability")
),

                       
tags$style(type="text/css", "body {padding-top: 80px;}")
))