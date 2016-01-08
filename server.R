
library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
        
        
        dataset <- reactive({
                #get sample of data set
                diamonds[sample(nrow(diamonds), input$sampleSize),]
               
        })
        
        output$plot <- renderPlot({
                
                p <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_point()
                
                if (input$color != 'None')
                        p <- p + aes_string(color=input$color)
 
                
                 if (input$jitter)
                         p <- p + geom_jitter()
                 if (input$smooth)
                       p <- p + geom_smooth()
                
                print(p)
                
        })
        
})
