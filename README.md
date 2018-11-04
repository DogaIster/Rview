# rview

## Rview for different visualization

## Dependencies:
 CRAN packages: 
    igraph
    networkD3
    
## Workflow Instructions:
````
library(devtools)
install_github("DogaIster/Rview")
library(rview)

#You will be welcomed to rview.

data_load()
#The system will ask you to put the location of your data file for edges, this file should be in .csv
#If you don't put the location and press enter, example data will be loaded for edges
#Same question will be asked again for you to specify the location of your data file for nodes
#Same process will follow

#After your data or the example data is loaded (it will show the data), the system will load the plot and interactive network setups (You won't get any notification about this one, you can assume after your data is loaded the system is ready to draw)
#Please check if igraph and networkD3 packages are checked out under packages.
#After this step:

draw()
#You will be asked specify the type of the visual representation you want to see. 
#"p" will draw you a plot without labels, "p_wl" will draw you a plot with the labels, "i" will draw you an interactive network 
#and "s" will draw you a sankey network.
#If you put an invalid input it will warn you to put a valid one.

# If you want to load a new dataset you need to use data_load().
````

Data Template:
Data consist two files; one of them is the data for nodes and the other is the data for edges.
1) The data for edges should have three columns named as from, to and type. The example data has only hyperlink
as a type but your data can also have mention in it.
2) The data for nodes should have four columns named as id, name, node.type and node.group. Name refers to the 
name that you wanna see in the networks. node.type is as the name implies, should be the type of the node such
as protein or reaction. Each node.type should have the same number for node.group.

You can see example data under inst > extdata.

Some useful keyboard shortcuts for package authoring:

* Build and Reload Package:  `Cmd + Shift + B`
* Update Documentation:      `Cmd + Shift + D` or `devtools::document()`
* Test Package:              `Cmd + Shift + T`
* Check Package:             `Cmd + Shift + E` or `devtools::check()`

Load the package (outside of this project) with: <br>
  devtools::install_github("DogaIster/Rview")
  
To see example results: you can click [here](https://drive.google.com/drive/folders/1K4nGqFZjIM44eiYbvsXiRFzku7OLpRnZ?usp=sharing).  
