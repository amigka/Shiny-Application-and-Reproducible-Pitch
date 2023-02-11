library(shiny)
library(UsingR)


shinyServer(function(input, output) {
  data(gapminder, package = "gapminder")
  
  model <- lm(lifeExp ~ gdpPercap, data = gapminder)
  
  
  modelpred <- reactive({
    gdpPercapInput <- input$slidergdpPercap
    predict(model, newdata = data.frame(gdpPercap = gdpPercapInput))
  })
  
  
  output$plot <- renderPlot({
    gdpPercapInput <- input$slidergdpPercap
    plot(data$gdpPercap, data$lifeExp,  xaxt="n", xlab = "GDP per capita", 
         ylab = "Life expectancy")
    
    if(input$showModel){
      abline(model, col = "red", lwd = 2)
    }
    points(gdpPercapInput, modelpred(), col = "red", pch = 16, cex = 2)
    
    
  })
  
  output$pred <- renderText({
    modelpred()
  })
  
  
})
