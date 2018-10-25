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

#The system will ask you to put the location of your data file for edges, this files should be in .csv
#If you don't put the location and press enter, example data will be loaded
#Same question will appear again to ask you the location of your data file for nodes
#Same process will follow

#After the your data or the example data is loaded, the system will load the plot and interactive
#network setups and will welcome you
#After this step:

draw()
#It will ask you what type of visual representation you want to draw. "p" will draw you a plot, "i" will draw you an 
#interactive network, "s" will draw you a sankey network.

# If you want to load net data you need to use data_load().
````

Some useful keyboard shortcuts for package authoring:

* Build and Reload Package:  `Cmd + Shift + B`
* Update Documentation:      `Cmd + Shift + D` or `devtools::document()`
* Test Package:              `Cmd + Shift + T`
* Check Package:             `Cmd + Shift + E` or `devtools::check()`

Load the package (outside of this project) with: <br>
  devtools::install_github("DogaIster/Rview")
