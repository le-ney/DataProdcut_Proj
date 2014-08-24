library(shiny)
shinyUI(pageWithSidebar(
        headerPanel('Developing Data Products Course Project'),
        sidebarPanel(
                h3('Data Entry Panel'),
                h4('Please enter average parents height in inches'),
                sliderInput('partent', 'Parent Height:', value = 68.2, min = 55, max = 80, step = 0.1),
                br(""),
                h4("Results:"),
                h5('Average parents height entered in inches:'),
                verbatimTextOutput("inputVal"),
                h5('Expected adult height in inches:'),
                verbatimTextOutput("result")
                
        ),
        mainPanel(
                h3('Height Calculator tool'),
                h5('Description:'),
                p('This is a children\'s adult height prediction calculator based on the 
                  linear regression analysis method. The Galton\'s data set which comprises 
                  of the average heights of parents and their children has been used for the regression 
                  model.Beside this calculator, another simply
                  way to predict the adult height for a children is simply double the 
                  height achieved by the second birthday of the child.'),
                h5('User Instructions:'),
                p('This is a very intuitive tool, all you need to point slider the desired average height 
                  of both parents. After selecting an average parents height the tool displays 
                  expected adult height in addition to the entered value (parameter). 
                  Also the red point on the graph indicates the estimated height value. 
                  By moving the slider you notice the position of the points in the plot changes. 
                  Please note, the minimum and maximum  are set to 55 and 80 respectively. 
                  Also the default value of slider is set to  68.2 which simply the median.'),
                plotOutput('plot')            
        )
))