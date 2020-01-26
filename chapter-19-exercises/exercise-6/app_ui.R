# Libraries
library(plotly)
library(shiny)

# ui.R
ui <- fluidPage(
  mainPanel(
    # Add a selectInput that allows you to select a variable to map
    selectInput(
      inputId = "var",
      label = "Select variable to map",
      choices = c("votes", "ratio", "population"),
      selected = "ratio"
    ),
    # Use `plotlyOutput()` to show your map
    plotlyOutput("map")
  )
)