# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# You can find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#loading the Shiny Package
library(shiny)
#A shiny app Template-
#UI , Server , ShinyApp 



#1) Define the UI ie the Desing and Layout of the Application
#Under the Hood Shiny uses Twitter Bootstrap as a CSS framework
# Add elements to the app as arguments to fluidPage()
ui <- fluidPage(
  
    #*Input() functions 
    sliderInput(inputId="num",label="Slider Input",value=10,min=0
                ,max=100) ,
  
    #*Output() functions
      plotOutput(outputId = "hist")
   
)

#2)Define Instructions for the server and how the app will interact 
#Tell server how to assemble inputs and outputs
server<-function(input,output) {
  #Save objects to display to output$
  #render()* builds reactive output to display in UI
  output$hist<-renderPlot({ 
                #All R code comes inside these {}
                
                  hist(rnorm(input$num),main="Histogram of 100 Random Normal Numbers",
                       xlab="Numbers",ylab="Count") }
                )
}


# Run the application using ShinyR
?shinyApp
shinyApp(ui = ui , server)

