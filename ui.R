#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predicting horsepower with weight and miles per gallon"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h2('Choose values of mpg and weight to create predictions'),
       sliderInput("mpg",
                   "MPG:",
                   min = 1,
                   max = 100,
                   value = 30),
       sliderInput("wt",
                   "Weight",
                   min = 1,
                   max = 100, 
                   value = 2)
    ),
  
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("predictions"),
      h2("Prediction from the model with mpg only"),
      textOutput("pred1"),
      h2("Predictions from the model with mpg and weight"),
      textOutput("pred2")
    )
  )
))
