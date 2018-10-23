# network.R
#
# Purpose:To draw an interactive metabolic network
# Version:1.0
# Date:September 24th, 2018
# Author:Doga Ister
#
# Input:
# Output:
# Dependencies:networkD3
#
# ToDo:Create a network using D3.js R library.
# Notes:
#
# ==============================================================================

#====  PARAMETERS  ============================================================
# Define and explain all parameters. No "magic numbers" in your code below.

#=== Libraries that are used ===#
library("devtools")
library("roxygen2")
library("igraph")
library("networkD3")

#==== CREATING THE PACKAGE DIRECTORY ====#
setwd("/Users/dogaister/Desktop/Courses/Fall_2018/BCB410/Rview")

# ====  PACKAGES  ==============================================================
# Load all required packages if they are not.

# if (! require(lintr, quietly=TRUE)) {
#   install.packages("lintr", repos="http://cran.rstudio.com/")
#   library(lintr)
# }
# #it has a cran package, change this
# if (! require(testthat, quietly=TRUE)) {
#   install.packages("testtgat", repos="http://cran.rstudio.com/")
#   library(testthat)
# }

#==== FUNCTIONS ====#
#' Load data
#'
#' This function asks user to specify the location of the data \cr
#' in their local computer and reads the specified CSV formatted data into R
#'
#' @param read.csv reads CSV formatted data into R
#'
#' @return None
#'
#' @examples
#' data_load() will show you the context of the data files you have specified
#' if you use it after devtools::load_all(".")
#' Please answer the questions with their full location like:
#' "/Users/JaneDoe/Desktop/BCB410/Rview/inst/extdata/data_edges.csv"
#'
#' For my use:
#' /Users/dogaister/Desktop/Courses/Fall_2018/BCB410/Rview/inst/extdata/data_edges.csv
#' /Users/dogaister/Desktop/Courses/Fall_2018/BCB410/Rview/inst/extdata/data_nodes.csv
#'
data_load <- function(){
  links_data <- readline(prompt= "Please specify the location of the data for links: ")
  if(links_data == ""){
      links <- read.csv("/Users/dogaister/Desktop/Courses/Fall_2018/BCB410/Rview/inst/extdata/data_edges.csv", header=T, as.is=T)
  } else{
      links <- read.csv(links_data, header=T, as.is=T)
  }

  nodes_data <- readline(prompt= "Please specify the location of the data for nodes: ")
  if(nodes_data == ""){
      nodes <- read.csv("/Users/dogaister/Desktop/Courses/Fall_2018/BCB410/Rview/inst/extdata/data_nodes.csv", header=T, as.is=T)
  } else{
      nodes <- read.csv(nodes_data, header=T, as.is=T)
  }
  print("Data Loaded")
  return(list(links=links, nodes=nodes))
}
data=data_load()
links=data$links
nodes=data$nodes

#==== PLOT ====#
#Using igraph's properties to define lines and nodes for the plot
net <- graph_from_data_frame(d=links, vertices=nodes, directed=T)
#Get rid off self loops and duplicates
net <- simplify(net, remove.multiple = F, remove.loops = T)
#See what it became to
net
#make the reactions orange, proteins steelblue
mycolours <- c("steelblue", "orange")
#color them according to their type
V(net)$color <- mycolours[V(net)$node.group]
print("Plot setups are ready")

#==== INTERACTIVE NETWORK ====#
#' data_interactive Function
#'
#' This function sets the required D3 variables for the interactive network view
#' @param data_interactive A function
#' @keywords interactive network D3 networkD3
#' @export
#' @examples
#'
data_interactive <- function(){
  #D3 needs numeric values in order to work and it starts from 0 not 1 so subtract 1
  links.d3 <- data.frame(from = match(links$from, nodes$id) - 1, to = match(links$to, nodes$id) - 1, value = 1)
  #node colors
  ColourScale <- 'd3.scaleOrdinal().range(["steelblue","orange"]);'
  #Make the order same as source file
  nodes.d3 <- cbind(idn=factor(nodes$name, levels=nodes$name), nodes)
  #Click action can color the selected node to another color
  myClick <- ' d3.select(this).select("circle").transition()
  .style("fill", "red");'
  print("Interactive network setups are ready")
  return(list(links.d3=links.d3, nodes.d3=nodes.d3, ColourScale=ColourScale, myClick=myClick))
}
data_int=data_interactive()
links.d3=data_int$links.d3
nodes.d3=data_int$nodes.d3
ColourScale=data_int$ColourScale
myClick=data_int$myClick

#' Trial Function
#'
#' This function lets user decide what kind of graph \cr
#' they want to use, for now it is limited to \cr
#' plot, interactive networks and sankey network
#'
#' @param trial is a function
#' @param readline reads the user's input
#' @param prompt prompts the user with a question/warning etc.
#'
#' @return the graph
#'
#' @export
#'
#' @examples
#' trial()
#'

trial <- function(){
  answer <- readline(prompt = "Enter p to draw a plot, i to draw an interactive network and anything else but p and i for sankey networks: ")
  if (answer == "p") {
    #draw a simple non-interactive plot
    plot(net, edge.arrow.size=.4, edge.curved=.4, vertex.label=NA, vertex.frame.color="#ffffff") #don't forget to get the labels back
  } else if (answer == "i") {
    forceNetwork(Links = links.d3,
                 Nodes = nodes.d3,
                 Source="from",
                 Target="to",
                 Value = "value",
                 NodeID = "name",
                 Group = "node.type",
                 linkColour = "#afafaf",
                 fontSize=12,
                 zoom=T,
                 colourScale = JS(ColourScale),
                 legend=T,
                 opacity = 0.8,
                 charge=-300,
                 arrows = TRUE,
                 bounded = TRUE,
                 opacityNoHover = 2,
                 width = NULL,
                 height = NULL,
                 clickAction = myClick)
  } else{
    sankeyNetwork(Links = links.d3, Nodes = nodes.d3, Source = "from", Target = "to",
                  NodeID = "name", Value = "value", fontSize = 16, unit = "Letter(s)")
  }
}

# [END]
