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
    #we will identify this input using input$num as a Reactive value
    
    sliderInput(inputId="num",label="Slider Input",value=10,min=0
                ,max=100) ,
    textInput(inputId="title",label="Input the title") ,
  
    #*Output() functions
      plotOutput(outputId = "hist") ,
      #for summary statistics of the numbers
      verbatimTextOutput(outputId = "stats")
   
)

#2)Define Instructions for the server and how the app will interact 
#Tell server how to assemble inputs and outputs
server<-function(input,output) {
  #Save objects to display to output$
  #render()* builds reactive output to display in UI
  #renderPlot() is a Reactive function which uses a reactive value
  
  #building reactive objects using reactive() and use this same data twice below
  data<-reactive(rnorm(input$num))
  
  output$hist<-renderPlot({ 
                #All R code comes inside these {}
    
                  #isolate() to make text field non reactive            
                  hist(rnorm(data()),main=isolate(input$title),
                       xlab="Numbers",ylab="Count",col="red",border="black",density=-0.5) 
                          })
  
  #outputting the summary statistics defined above in UI
  output$stats<-renderPrint({summary(data())   
                        })
                

                  
                  }#closing server function



# Run the application using ShinyR
?shinyApp
shinyApp(ui = ui , server)

