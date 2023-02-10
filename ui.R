library(shiny)
shinyUI(fluidPage(
  titlePanel("Predicting the life expectancy"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("slidergdpPercap", "What is the life expectancy?", 0, 100000, value = 1000),
      checkboxInput("showModel", "Show/Hide regression line", value = TRUE),
      submitButton("Submit") 
    ),
    mainPanel(
      plotOutput("plot"),
      h3("Predicted life expectancy:"),
      textOutput("pred"),
      
    )
  )
))