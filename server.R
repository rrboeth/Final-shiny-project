#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  model1<-lm(hp~mpg, data = mtcars)
  model2<-lm(hp~mpg+wt, data = mtcars)
  
  model1prediction<-reactive({
    mpginput<-input$mpg
    predict(model1, newdata = data.frame(mpg = mpginput))
  })
   
  model2prediction<-reactive({
    mpginput<-input$mpg
    wtinput<-input$wt
    predict(model2,newdata = data.frame(mpg = mpginput, wt = wtinput))
  })
  
  output$pred1<-renderText({
    model1prediction()
  })
  
  output$pred2<-renderText({
    model2prediction()
  })
  
    
  })
