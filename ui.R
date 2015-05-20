# ui.R
# 
# created by M. Jung
# 20.05.2015
# Version 1.0
#

library(shiny)
library(stats) 
library(graphics)
library(datasets)

shinyUI(pageWithSidebar(
        
        headerPanel('Analysis of Mtcars'),
        
        sidebarPanel(
                checkboxGroupInput('show_vars', 'Select Columns from mtcars to use:', names(mtcars),
                                   selected = names(mtcars)),
                h2('Your Choice:'),
                verbatimTextOutput("yourchoice"),
                helpText('See documentation on Tab "Documentation".')
        ),
        
        mainPanel(
                tabsetPanel(
                        tabPanel('Documentation',
                                h3('Documetation of the application'),
                                p('This Application helps to analyse the  "Motor Trend Car Road Tests" dataset (mtcars).'),
                                br(), 
                                strong('About the data'),
                                p('The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models).'),
                                p(' '),
                                p('A data frame with 32 observations on 11 variables.'),
                                p(' '),
                                p('[, 1]	 mpg	 Miles/(US) gallon'),
                                p('[, 2]	 cyl	 Number of cylinders'),
                                p('[, 3]	 disp	 Displacement (cu.in.)'),
                                p('[, 4]	 hp	 Gross horsepower'),
                                p('[, 5]	 drat	 Rear axle ratio'),
                                p('[, 6]	 wt	 Weight (lb/1000)'),
                                p('[, 7]	 qsec	 1/4 mile time'),
                                p('[, 8]	 vs	 V/S'),
                                p('[, 9]	 am	 Transmission (0 = automatic, 1 = manual)'),
                                p('[,10]	 gear	 Number of forward gears'),
                                p('[,11]	 carb	 Number of carburetors'),
                                br(), 
                                strong('Selection of Attributes'),
                                p('On the left side you can choose which of the 11 vartiables you want to include in your analyse.'),
                                br(),
                                strong('Folder "mtcars - data"'),
                                p('The Folder "mtcars-data" contains the data. Only the columns from your selection are shown.'),
                                p('Further you can:'),
                                p('- decide how many entries you want to see on one side (15 rows, 30 rows or 45 rows),'),
                                p('- search in the data,'),
                                p('- sort the data. Therefore you have to click on the symbols right from each attribute'),
                                p('- Filter each column (type a value in the box under the columns)'),
                                p('- if there are more pages (p.e. if you have choosen 15 entries per page) youn can navigate the sites'),
                                br(),
                                strong('Folder "Plot"'),
                                p('The Folder "Plot" contains the "Scatterplot Matrices" of the selectes attributes.
                                The plot swows the correlation between the variables. For the Transmission (am) I have chosen different colors. Green are the cars with automatic transmission, blue the cars with manual transmission.   
                                Note: if you choose only one attribue then a scatterplot is not possible. So the application shows the boxplot of the attribute.'),
                                br(),
                                strong('Folder "Linear Model"'),
                                p('In the Folder "Linear Model" you get for "mpg" the summary for the function "lm" (Fitting Linear Models).
                                Play a little bit around and explore the relationship between a set of variables (your selection) and miles per gallon (MPG).
                                See how the "adjusted R squares" changes.'),
                                br(),
                                p('Have fun ...')
                        ),
                        tabPanel('mtcars - data',
                                 br(),
                                 dataTableOutput("mytable1")),
                        tabPanel('Plot',
                                 br(),
                                 plotOutput("myplot1")),
                        tabPanel('Linear Model',
                                 br(),
                                 strong('Linear Model for "mpg".'),
                                 br(),
                                 strong(verbatimTextOutput("fit")),
                                 br(),
                                 strong('summary(lm(fit))'),
                                 br(),
                                 verbatimTextOutput("fit.summary"),
                                 br()
                        )
                )
        )
))
