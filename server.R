library(shiny)
library(datasets)
data(mtcars)


server <- function(input, output) 
{
  
  searchResultAll <- reactive({
    validate(
      need(input$variable != "", "Please select at least one feature from the left")
    )
    
    mtcars[,c(input$variable),drop = FALSE]
  })
  
  
  searchResult <- reactive({
    validate(
      need(input$variable != "", "Please select at least one feature from the left")
    )
    
    subset(mtcars[,input$variable, drop = FALSE],rownames(mtcars) == input$model)
  })

  
  output$result = renderDataTable({
      
    if (input$model == "All") {
       if (is.null(input$variable)){
         searchResultAll()
       }
       else{
         searchResultAll()
       }
    }
    else{
      searchResult()
    }  
  })
  
  
}


