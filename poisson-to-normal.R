# visualization of poisson distribution and how it converges to normal distribution
library(shiny)

ui <- fluidPage(
  sliderInput("ff","ff",value = 0,
              min = 0,max = 100),
  plotOutput("x"),
  plotOutput("y")
)

server <- function(input, output){
  r <- reactive({rpois(1000,lambda = input$ff)})
  output$x <- renderPlot({
    plot(1:1000,r())
  })
  output$y <- renderPlot({
    qqnorm(r())
  })
}

shinyApp(ui = ui, server = server)
