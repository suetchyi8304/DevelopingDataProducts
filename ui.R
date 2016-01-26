library(shiny)
library(datasets)
library(DT)
data(mtcars)

mtcars$model <- rownames(mtcars)

ui <- fluidPage(
  titlePanel("Motor Trend Cars"),
  headerPanel(h4("This shiny application allows user to select all or certain car make/model together with different aspects in order to compare the performance for 32 different cars. Result is being displayed at the right side panel.")),
  sidebarLayout(
    sidebarPanel(
      selectInput("model", 
                  "Select car model(s):", 
                  selected = "All", 
                  c("All", as.character(mtcars$model))),
      checkboxGroupInput("variable", "(de-)Select car feature(s):",
                         c("Miles Per Gallon" = "mpg",
                           "Number Of Cylinders" = "cyl",
                           "Displacement (cu.in.)" = "disp",
                           "Gross Horsepower" = "hp",
                           "Rear Axle Ratio" = "drat",
                           "Weight (1000 lbs)" = "wt",
                           "1/4 Mile Time" = "qsec",
                           "V/S" = "vs",
                           "Transmission" = "am",
                           "Number Of Forward Gears" = "gear",
                           "Number Of Carburetors" = "carb"),
                         selected = c("mpg","cyl","disp","hp","drat","wt","qsec","vs","am","gear","carb"))
      ),
    mainPanel(h2("Car(s) summary:"),
              #tabsetPanel(
               # tabPanel("Data", tableOutput("result"))
               # )
              
              dataTableOutput("result")
    )
  ))

