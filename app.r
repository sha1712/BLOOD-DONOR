library(shiny)
library(shinyWidgets)
library(readr)
ui <- fluidPage(
  setBackgroundImage(
    
    src = "q.jpeg"
    
  ),
  
  titlePanel("BloodBank"),
  sidebarLayout(
    sidebarPanel(
      tags$head(tags$style('body {color:red;}')),
      # uiOutput ("IMG"),
      img(src = "A.jpg",height = 200, width = 200),
      selectInput(inputId = "dataset",
                  label = "Choose a blood group:",
                  choices = c("A+", "A-", "O+","B+", "AB-", "O-","AB-", "B-")),
      selectInput(inputId = "dataset",
                  label = "enter your location",
                  choices = c("Mumbai","Delhi","Chennai","Bangalore", "Hyderabad","Ahmedabad","Kolkata", "Surat", "Pune", "Jaipur","Cochin", "Lucknow", "Kanpur","Nagpur", "Indore","Thane","Bhopal", "Visakhapatnam", "Noida","Patna","Vadodara", "Ghaziabad", "Ludhiana", "Agra", "Nashik", "Faridabad","Meerut","Rajkot","Bhubaneshwar","Salem","Solapur","Varanasi", "Srinagar", "Aurangabad", "Dhanbad","Amritsar","Trivendram","Allahabad","Ranchi","Howrah","Coimbatore","Jabalpur","Gwalior","Vijayawada","Jodhpur","Madurai","Raipur","Kota", "Guwahati")),
      numericInput(inputId = "obs",
                   label = "Number of students details to view:",
                   value = 100)
    ),
    
    
    
    mainPanel(
      tabsetPanel(
        tabPanel("blood donor", 
                 tableOutput("view")),
        
        id = "conditionedPanels"
      )
      
    )
  )
)


# Define server logic to summarize and view selected dataset ----
server <- function(input, output) {
  
  # Return the requested dataset ----
  datasetInput <- reactive({
    switch(input$dataset,
           "A+"= ap, 
           "A-"= an, 
           "O+"= op,
           "B+"= bp, 
           "AB+"= abn, 
           "O-"= on,
           "AB-"=abn, 
           "B-"=bn
    )
    
  })
  
  output$view <- renderTable({
       head(datasetInput(), n = input$obs)
    
  })
  
}

shinyApp(ui=ui, server=server)




