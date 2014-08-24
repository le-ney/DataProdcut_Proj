#require("UsingR")
library(UsingR)
data(galton)
library(ggplot2)

lmModel <- lm(child ~ parent, data=galton)
galton_with_pred <- data.frame(galton, predict(lmModel, interval = 'prediction'))

childHeight <- function(parentHeight) {
        lmModel$coeff[1] + lmModel$coeff[2] * parentHeight
}

shinyServer(
        function(input, output) {
                predictedHeight<- reactive({childHeight(input$partent)})
                output$inputVal<- renderPrint({input$partent})
                output$result <- renderPrint({paste(round(predictedHeight(), 2),'')})
                output$plot <- renderPlot({
                        p <- ggplot(galton_with_pred, aes(x = parent, y = child)) + 
                                geom_point() +
                                geom_smooth(method = 'lm', aes(fill = 'confidence'), alpha = 0.5) +
                                geom_ribbon(aes(y = fit, ymin = lwr, ymax = upr, fill = 'prediction'),
                                            alpha = 0.2) +
                                scale_fill_manual('Interval', values = c('green', 'blue')) +
                                theme(legend.position = c(0.20, 0.85))
                        newdata <- data.frame(parent = input$partent, child= round(predictedHeight(), 2))
                        p + geom_point(data=newdata,colour="red",size=6)
                        
                })
        }
)