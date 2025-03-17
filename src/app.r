library(shiny)
library(shinydashboard)
library(ggplot2)
library(DT)
library(rsconnect)

# Load the dataset
df <- read.csv("../data/cats_dataset.csv")
colnames(df) <- gsub("[^[:alnum:]]", "_", colnames(df))
# UI part of the Shiny app
ui <- dashboardPage(
  dashboardHeader(title = "Cats Dataset Dashboard"),
  dashboardSidebar(
    selectInput("breed", "Select Breed:", choices = c("All", unique(df$Breed)), selected = "All"), # nolint
    selectInput("gender", "Select Gender:", choices = c("All", unique(df$Gender)), selected = "All"), # nolint
    selectInput("color", "Select Color:", choices = c("All", unique(df$Color)), selected = "All") # nolint
  ),
  dashboardBody(
    fluidRow(
      box(plotOutput("agePlot"), width = 6),
      box(plotOutput("weightPlot"), width = 6)
    ),
    fluidRow(
      box(DTOutput("table"), width = 12)
    )
  )
)

# Server part of the Shiny app
server <- function(input, output) {
  filtered_data <- reactive({
    data <- df
    if (input$breed != "All") {
      data <- subset(data, Breed == input$breed)
    }
    if (input$gender != "All") {
      data <- subset(data, Gender == input$gender)
    }
    if (input$color != "All") {
      data <- subset(data, Color == input$color)
    }
    return(data)
  })

  output$agePlot <- renderPlot({
    ggplot(filtered_data(), aes(x = Age__Years_)) +  # Match actual column name
      geom_histogram(binwidth = 1, fill = "blue", alpha = 0.7) +
      labs(title = "Age Distribution", x = "Age (Years)", y = "Count") +
      theme_minimal()
  })
  
  output$weightPlot <- renderPlot({
    ggplot(filtered_data(), aes(x = Weight__kg_)) +  # Match actual column name
      geom_histogram(binwidth = 1, fill = "green", alpha = 0.7) +
      labs(title = "Weight Distribution", x = "Weight (kg)", y = "Count") +
      theme_minimal()
  })
  
  

  output$table <- renderDT({
    datatable(filtered_data(), options = list(pageLength = 10))
  })
}

# Create manifest file for deployment
rsconnect::writeManifest()

# Run the application
shinyApp(ui = ui, server = server)
