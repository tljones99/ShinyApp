Course Project: Shiny Application and Reproducible Pitch
========================================================
author: Terry Jones 
date: 11/13/2018
autosize: true

First Slide
========================================================

Introduction

- This is a very simple demonstration of using Shiny to create a slider application for visualizing the effect of observation sizes on the output.  A larger number of observations will reduce variation in the histogram.
- Generates random numbers based on the quantity of observations selected on the slider
- Results of input are displayed in a histogram
- .  For more information for creating your own customized slider app, go to this link:
https://shiny.rstudio.com/articles/sliders.html


========================================================
Code 

```r
library(shiny)
library(rsconnect)
library(ggplot2)
library(leaflet)
shinyUI <- fluidPage(titlePanel("Random Distribution Generator"),
    sidebarLayout(sidebarPanel(
            radioButtons("dist", "Distribution type:",
                c("Normal" = "norm", "Log-normal" = "lnorm","Exponential" = "exp")),
            br(),
            sliderInput("n","Number of observations:",
                        value = 1000, min = 1, max = 2000)
        ),
        mainPanel(tabsetPanel(type = "tabs",
                        tabPanel("Plot", plotOutput("plot")),
                        tabPanel("Summary", verbatimTextOutput("summary")),
                        tabPanel("Table", tableOutput("table")))))
)

shinyServer <- function(input, output) {
    d <- reactive({
        dist <- switch(input$dist,norm = rnorm,lnorm = rlnorm,exp = rexp,rnorm)
        dist(input$n)
    })
    output$plot <- renderPlot({
        dist <- input$dist
        n <- input$n
        hist(d(),
             main = paste("r", dist, "(", n, ")", sep = ""),
             col = "red", border = "white")
    })
    output$summary <- renderPrint({
        summary(d())
    })
    output$table <- renderTable({d()
    })
}
```

Slide With Plot
========================================================

 https://tljones99.shinyapps.io/ShinyAppRD/
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
