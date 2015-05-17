library(shiny)
library(ggplot2)  # for the diamonds dataset

shinyUI(pageWithSidebar(
        headerPanel('Analysis of Mtcars'),
        sidebarPanel(
                checkboxGroupInput('show_vars', 'Select Columns from mtcars to use:', names(mtcars),
                                   selected = names(mtcars)),
                helpText('Dies ist ein Test.')
        ),
        mainPanel(
                tabsetPanel(
                        tabPanel('mtcars - data',
                                 dataTableOutput("mytable1")),
                        tabPanel('Plot',
                                 plotOutput("mytable2")),
                        tabPanel('Linear Model',
                                 verbatimTextOutput("mybtable3"))
                )
        )
))
