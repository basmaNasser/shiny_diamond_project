

library(shiny)
library(ggplot2)

dataset <- diamonds

shinyUI(fluidPage(
        
        title = "Diamonds Explorer",
        
        plotOutput('plot'),
        textOutput("text1"),
        
        
        hr(),
        
sidebarLayout(
              sidebarPanel(
                          
                           h3("Diamonds Explorer"),
                           
                           
                           sliderInput('sampleSize', 'Sample Size', 
                                       min=1, max=nrow(dataset), value=min(1000, nrow(dataset)), 
                                       step=500, round=0),
                           br(),
                           "Diamond Explorer project shows the relation between prices and 54,000 different type of diamonds.",
                           br(),
                           "1- you can select small sample or the whole data.",
                           br(),
"2- you can select different columns to compare with in X and Y axis.",
br(),
"3- can select to smooth or jitter graph type to be added to the diagram.",
br(),
"4- in addition, you can diffrentiate the diagram to different group by selecting color facet. Ex: group by cuts or prices"
                           
                           ),
  mainPanel(
    fluidRow(
      
      column(3,
             h4("Geometry Type"),
             br(),
             checkboxInput('jitter', 'Jitter'),
             checkboxInput('smooth', 'Smooth')
      ),
      
      column(5,h4("select Columns"), offset = 1,
             selectInput('x', 'X', names(dataset)),
             selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
             selectInput('color', 'Color', c('None', names(dataset)))
      )
      
    )
    
    
    )
)
      
))

        
