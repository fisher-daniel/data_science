library(shiny)
library(ggplot2)
library(plotly)
library(scales)
library(lubridate)
library(ggmap)


shinyUI(pageWithSidebar(
  
  headerPanel("Hubio Accelerometer"),
  
  sidebarPanel(
    selectInput("variable", "Variable:",
                list("Car Frame" = "car_frame",
                     "Gyroscope" = "gyroscope")),
    
    
    sliderInput("durationx","Time :",
                min=min(df$timer),max=max(df$timer), value = c(min(df$timer), max(df$timer)))
    
  ),
  
  mainPanel(
    
    plotOutput("plotMap"),
    
    plotlyOutput("plotx"),
    
    plotlyOutput("ploty"),
    
    plotlyOutput("plotz")
    
    
  )
  
))
