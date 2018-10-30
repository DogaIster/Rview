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
#"p" will draw you a plot, "i" will draw you an interactive network 
#and "s" will draw you a sankey network.
#If you put an invalid input it will warn you to put a valid one.

# If you want to load a new dataset you need to use data_load().
````

Some useful keyboard shortcuts for package authoring:

* Build and Reload Package:  `Cmd + Shift + B`
* Update Documentation:      `Cmd + Shift + D` or `devtools::document()`
* Test Package:              `Cmd + Shift + T`
* Check Package:             `Cmd + Shift + E` or `devtools::check()`

Load the package (outside of this project) with: <br>
  devtools::install_github("DogaIster/Rview")
