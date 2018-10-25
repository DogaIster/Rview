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

# /Users/dogaister/Desktop/Courses/Fall_2018/BCB410/Rview/inst/extdata/data_edges.csv
# /Users/dogaister/Desktop/Courses/Fall_2018/BCB410/Rview/inst/extdata/data_nodes.csv
data_load <- function(){
  links_data <- readline(prompt= "Please specify the location of the data for links: ")
  if(links_data == ""){
    links <- read.csv("/Users/dogaister/Desktop/Courses/Fall_2018/BCB410/Rview/inst/extdata/data_edges.csv", header=T, as.is=T)
    print("Example data for edges is loaded")
  } else{
    links <- read.csv(links_data, header=T, as.is=T)
  }
  nodes_data <- readline(prompt= "Please specify the location of the data for nodes: ")
  if(nodes_data == ""){
    nodes <- read.csv("/Users/dogaister/Desktop/Courses/Fall_2018/BCB410/Rview/inst/extdata/data_nodes.csv", header=T, as.is=T)
    print("Example data for nodes is loaded")
  } else{
    nodes <- read.csv(nodes_data, header=T, as.is=T)
  }
  return(list(links=links, nodes=nodes))
}
data=data_load()
links=data$links
nodes=data$nodes

# [END]
