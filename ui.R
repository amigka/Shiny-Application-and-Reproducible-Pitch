library(shiny)
shinyUI(fluidPage(
  titlePanel("Predicting the life expectancy"),
  p("This app allows the user show how life expectancy in related to GDP per capita"),
  h3("Directions on how to use this interface"),
  p("1). Use the scroll bar to select the desired GDP per capita."),
  p("3). See the predicted life exprctancy calculated by the tool."),
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
