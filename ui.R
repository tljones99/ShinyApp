#Develop Data Products Project 4
#Terry Jones
#11/13/2018

library(shiny)
library(rsconnect)
library(ggplot2)
library(leaflet)


# Define UI for random distribution app
shinyUI <- fluidPage(
    
    # Create a Random Distbituion Generator 
    titlePanel("Random Distribution Generator"),
    sidebarLayout(
        
        # Create sidebar panel for inputs
        sidebarPanel(
            
            # Input: Select the random distribution type
            radioButtons("dist", "Distribution type:",
                         c("Normal" = "norm",
                           "Log-normal" = "lnorm",
                           "Exponential" = "exp")),
            
            # introduce extra vertical spacing
            br(),
            
            # Input: number of observations to generate
            sliderInput("n",
                        "Number of observations:",
                        value = 1000,
                        min = 1,
                        max = 2000)
            
        ),
        
        # Main panel for displaying outputs
        mainPanel(
            
            # Output: Tabset w/ plot, summary, and table
            tabsetPanel(type = "tabs",
                        tabPanel("Plot", plotOutput("plot")),
                        tabPanel("Summary", verbatimTextOutput("summary")),
                        tabPanel("Table", tableOutput("table"))
            )
            
        )
    )
)