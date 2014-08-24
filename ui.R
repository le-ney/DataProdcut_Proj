library(shiny)
shinyUI(pageWithSidebar(
        headerPanel('Developing Data Products Course Project: Shiny Application'),
        sidebarPanel(
                h3('Data Entry Panel'),
                h4('Please enter average parent heights in inches'),
                sliderInput('partent', 'Parent Height:', value = 64, min = 40, max = 90, step = 0.1),
                br(""),
                h4("Results:"),
                h5('Average parent heights entered in inches:'),
                verbatimTextOutput("inputVal"),
                h5('Expected adult height in inches:'),
                verbatimTextOutput("result")
                
        ),
        mainPanel(
                h3('Height Calculator tool'),
                p('This is a children\'s adult height prediction calculator based on the 
                  linear regression analysis method. Beside this calculator, another simply
                  way to predict the adult height for a children is simply double the 
                  height achieved by the second birthday of the child.'),
                plotOutput('plot')            
        )
))