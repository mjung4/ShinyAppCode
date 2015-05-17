library(shiny)

shinyServer(function(input, output) {
        
        # a large table, reative to input$show_vars
        output$mytable1 = renderDataTable({
                mtcars[, input$show_vars, drop = FALSE]
        }, options = list(bSortClasses = TRUE, aLengthMenu = c(5, 30, 50), iDisplayLength = 5))

        # customize the length drop-down menu; display 5 rows per page by default
        output$mytable2 = renderPlot({ 
                plot(mtcars$mpg, mtcars$wt)
                })
        
        # customize the length drop-down menu; display 5 rows per page by default
        output$mytable3 = renderPrint(summary(lm(mpg ~ wt, data = mtcars))) 
                
})
