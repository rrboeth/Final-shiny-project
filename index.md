---
title       : 
subtitle    : 
author      : 
job         : 
framework   : html5slides        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Read-And-Delete

My Final Coursera Project
Riley B
Date: 12.11.17

--- 

## Slide 2

My project uses the mtcars dataset, to predict horespower with miles per gallon and weight, with two different models.

---

My application takes two inputs: mpg and weight of the car.  

---

My application then produces two outputs: the output from the model with only mpg, and the output from the model with weight and mpg.  

---

Thank you! 

```r
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
```



