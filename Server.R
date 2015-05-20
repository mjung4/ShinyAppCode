# Server.R
# 
# created by M. Jung
# 20.05.2015
# Version 1.0
#

library(shiny)

shinyServer(function(input, output) {

        output$mytable1 = renderDataTable({
                mtcars[, input$show_vars, drop = FALSE]
                }, 
                options = list(
                        bSortClasses = TRUE, aLengthMenu = c(15, 30, 45), iDisplayLength = 15
        ))

        output$yourchoice = renderPrint({
                input$show_vars
        })
        
        output$myplot1 = renderPlot({
                n <- length(input$show_vars)
                if (n > 1) {
                        pairs(mtcars[,input$show_vars], panel = panel.smooth,
                       col = 3 + mtcars$am)
                }
                else {
                        boxplot(mtcars[,input$show_vars])
                }
                         
        })
        
         output$fit = renderPrint({
                 n <- length(input$show_vars)         
                 if (n == 0 | (n == 1) &&  input$show_vars[1] == "mpg" ) {
                         fitpaste <- 'Please choose at least one attribut unequal mpg!'
                 }
                 else {
                        if (input$show_vars[1] == "mpg") {
                                fitcols <- input$show_vars[2:n]
                        } else
                        {
                                fitcols <- input$show_vars[1:n]
                        }
                        fitpaste <- paste(fitcols, collapse=" + ")
                        fitpaste <- paste("fit <- mpg ~ ", fitpaste, sep = "")
                 }
                 return(fitpaste)
                 
         })
         
         output$fit.summary = renderPrint({
                n <- length(input$show_vars)
                
                if (n == 0 | (n == 1) &&  input$show_vars[1] == "mpg" ) {
                        fit.summary <- 'Please choose at least one attribut unequal mpg!'
                }
                else {
                        if (input$show_vars[1] == "mpg") {
                                fitcols <- input$show_vars[2:n]
                        } else
                        {
                                fitcols <- input$show_vars[1:n]
                        }
                        fit <- paste(fitcols, collapse=" + ")
                        fit <- paste("mpg ~ ", fit, sep = "")
                        fit <- lm(fit, data = mtcars)
                        fit.summary <- summary.lm(fit)
                }
                return(fit.summary)
        })
        
})
