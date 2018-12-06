# rview

## Rview: for different visualizations in one package
Rview is an R package that gives the user the ability to create different kinds of visualizations of a network without
a need to use of different packages. 
This package lets you draw a plot, a plot just with labels, an interactive network representation, and a Sankey network representation. The addition of the Shiny package also gives the user different kinds of abilities.

## Dependencies:
 CRAN packages: 
    igraph
    networkD3
    
## R Version:
3.4.3
('BiocManager' is not available for this version).

## Workflow Instructions:
````
library(devtools)
install_github("DogaIster/Rview")
library(rview)

#You will be welcomed to rview.

data_load()
#This is the function to load the data. You don't need to use it, example data will be automatically loaded.

draw()
#You will be asked to specify the type of the visual representation you want to use. 
#"p" will draw you a plot with labels, "l" will draw you a plot "just" with the labels, "i" will draw you an interactive network 
#and "s" will draw you a sankey network.If you write "shiny" it will direct you to use the Shiny library but this will be limited
#to interactive network and sankey network.
#If you put an invalid input it will warn you to put a valid one.

useShiny()
#This will allow you to see your interactive or sankey networks using Shiny. 
#For interactive network you will be able to set the opacity from 0.1 to 1.
#For sankey network you will be able to set if you want it to sink right or not.

````

## Data Template:
Data should consist two separate files; one of them is the data for nodes and the other is the data for edges.
1) The data for edges should have three columns named as from, to and type. The example data has only hyperlink
as a type but your data can also have mention instead hyperlink.
2) The data for nodes should have four columns named as id, name, node.type and node.group. Name refers to the 
name that you wanna see in the visual representation. node.type is as the name implies, should be the type of the node such
as protein or reaction. Each node.type should have the same number for node.group. In the example data; proteins are one group
and reactions are the other one.

You can see example data under inst > extdata.

## Install

````
library(devtools)
install_github("DogaIster/Rview")
library(rview)

````

## Sample Results:

Sample results can be found [here](https://drive.google.com/open?id=1K4nGqFZjIM44eiYbvsXiRFzku7OLpRnZ)

Some useful keyboard shortcuts for package authoring:

* Build and Reload Package:  `Cmd + Shift + B`
* Update Documentation:      `Cmd + Shift + D` or `devtools::document()`
* Test Package:              `Cmd + Shift + T`
* Check Package:             `Cmd + Shift + E` or `devtools::check()`


  


