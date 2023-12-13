options(encoding = 'UTF-8')
library(shiny)
library(tidyverse)

# Verb form data from NC21 corpus

data <- readLines("nc21_verbs_all.txt", encoding = 'UTF-8')

# Extract lemma information
lemmas <- str_extract_all(data, "^\\S+\\s*\\(Total Count: \\d+\\):\\s*\\(Relative frequency: [\\d.]+\\)$") %>%
  unlist()

# Define UI
ui <- fluidPage(
  tags$head(
    tags$meta(charset = 'UTF-8'),
    tags$style(
      HTML("
        body {
          background-color: #FFFAF0;
        }
      ")
    )
  ),
  titlePanel("Form Distribution in Lemma"),
  sidebarLayout(
    sidebarPanel(
      textInput("manualLemma", "Enter Lemma:"),
      hr(),
      helpText("Please wait a moment for the list to update after entering a lemma.")
    ),
    mainPanel(
      tableOutput("lemmaTable"),
      plotOutput("frequencyPlot")
    )
  )
)

# Define server
server <- function(input, output) {
  
  # Function to extract words and frequencies for a given lemma
  getLemmaData <- reactive({
    if (!is.null(input$manualLemma)) {
      lemma_selected <- str_extract(input$manualLemma, "^\\S+")
    } else {
      lemma_selected <- NULL
    }
    
    if (!is.null(lemma_selected)) {
      # Find the line corresponding to the selected lemma
      lemma_line <- grep(paste0("^", lemma_selected, " "), data)
      
      if (length(lemma_line) > 0) {
        # Find the index of the selected word in the original data
        selected_word_index <- match(data[lemma_line], data)
        
        # Extract data for the selected lemma and lines until a new lemma starts
        next_lemma_line <- grep("^\\S+", data[(selected_word_index + 1):length(data)])  # Find the line where the next lemma starts
        if (length(next_lemma_line) > 0) {
          selected_data <- data[selected_word_index:(selected_word_index + next_lemma_line[1] - 2)]
        } else {
          selected_data <- data[selected_word_index:length(data)]
        }
        
        # Process the data
        lemma_data <- strsplit(selected_data, "\\t") %>%
          map(~ data.frame(word = .[2], count = as.integer(gsub(",", "", .[3])), frequency = as.numeric(gsub("\\)", "", .[4])))) %>%
          bind_rows()
      } else {
        # If the lemma is not found, return an empty data frame
        lemma_data <- data.frame(word = character(), count = integer(), frequency = numeric())
      }
    } else {
      # If manualLemma is NULL, return an empty data frame
      lemma_data <- data.frame(word = character(), count = integer(), frequency = numeric())
    }
    
    lemma_data
  })
  
  observe({
    })
  
  
  # Display the table of words and frequencies
  output$lemmaTable <- renderTable({
    lemma_data <- getLemmaData()
    
    if (!is_empty(lemma_data)) {
      lemma_data$frequency <- sprintf("%.4f", lemma_data$frequency)
    }
    
    # Explicitly set encoding for the word column
    lemma_data$word <- iconv(lemma_data$word, to = 'UTF-8')
    
    lemma_data
  })
  
}

# Run the application
shinyApp(ui = ui, server = server)