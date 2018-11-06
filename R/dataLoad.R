# data_load.R
#
# Purpose:To load the desired .csv data files
# Version:1.0
# Date:October 25th, 2018
# Author:Doga Ister
#
# Input: "/Users/JaneDoe/Desktop/BCB410/Rview/inst/extdata/data_edges.csv"
# Output: "Data loaded"
# Dependencies:N/A
#=========================================================================

#' Load data
#'
#' This function asks user to specify the location of the data for edges and
#' for nodes separately in their local computer and reads the specified CSV
#' formatted data into R if user doesn't specify a location for the data,
#' example data will be loaded.
#' Please answer the questions with their full location like:
#' "/Users/JaneDoe/Desktop/BCB410/Rview/inst/extdata/data_edges.csv"
#' @return None
#' @usage
#' data_load()
#' @export
#'

data_load <- function(){
  data<-data_load
  #data for edges
  edgesCSV <- (system.file("extdata", "data_edges.csv", package = "rview"))
  links <- read.csv(edgesCSV, header=T, as.is=T)
  print("Example data for edges is loaded")
  #data for nodes
  nodesCSV <- (system.file("extdata", "data_nodes.csv", package = "rview"))
  nodes <- read.csv(nodesCSV, header=T, as.is=T)
  print("Example data for nodes is loaded")

  return(list(links=links, nodes=nodes))
}

data<-data_load()
links<-data$links
nodes<-data$nodes


# [END]
