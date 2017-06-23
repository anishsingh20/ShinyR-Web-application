# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# You can find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#loading the Shiny Package
library(shiny)

#1) Define the UI ie the Desing and Layout of the Application
#Under the Hood Shiny uses Twitter Bootstrap as a CSS framework
# Add elements to the app as arguments to fluidPage()
ui <- fluidPage(
    {"Hello World"},
    "This is Anish")

#This is simply a HTML code 
ui

#2)Define Instructions for the server and how the app will interact 
server<-function(input,output) {}

# Run the application using ShinyR
?shinyApp
shinyApp(ui = ui , server)

