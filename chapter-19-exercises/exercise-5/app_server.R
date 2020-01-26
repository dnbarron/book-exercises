### Exercise 5 ###

library(shiny)
library(ggplot2)
# Create a shiny server that creates a scatterplot. 

# It should use an `input` with features: `x_var`, `y_var`, `color`, and `size`
# Save the result of `renderPlot` to output$scatter
server <- function(input, output){
  output$scatter <- renderPlot({
      ggplot(data = mpg,
           aes_string(x = input$x_var, y = input$y_var, colour = input$color)) +
      geom_point(size = input$size)
  })
}