library(shiny)

ui <- fluidPage(
  titlePanel("Standard Normal Probabilities"), #Creates the Title.
  sidebarLayout(  #Gives the app a layout, so it isn't all just text. 
    sidebarPanel(
      numericInput(inputId = "z_score", 
               label = "Type In A Z-Score To Find It's Respective P-Value", 
               value = 0)), #Defines the input, z-score, and assigns it a default value of 0.
    mainPanel(h5("Respective P-Value:"),textOutput("p_value")) #Defines the output, p_value. 
  )
)


server <- function(input, output) {
  output$p_value <- reactive({pnorm(input$z_score)}) #Calculate p-values using pnorm
}

shinyApp(ui = ui, server = server)

