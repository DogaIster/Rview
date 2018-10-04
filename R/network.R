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
library(roxygen2)
library("igraph")
library("networkD3")

#==== CREATING THE PACKAGE DIRECTORY ====#
setwd("/Users/dogaister/Desktop/Courses/Fall_2018/BCB410/Rview")

# ====  PACKAGES  ==============================================================
# Load all required packages if they are not.

if (! require(lintr, quietly=TRUE)) {
  install.packages("lintr", repos="http://cran.rstudio.com/")
  library(lintr)
}
#it has a cran package, change this
if (! require(testthat, quietly=TRUE)) {
  install.packages("testtgat", repos="http://cran.rstudio.com/")
  library(testthat)
}

#==== FUNCTIONS ====#
#Load the data
#use gdata when you figure it out how it works, also use rname variables
links <- read.csv("/Users/dogaister/Desktop/Courses/Fall_2018/BCB410/Rview/inst/data/data_edges.csv", header=T, as.is=T)
nodes <- read.csv("/Users/dogaister/Desktop/Courses/Fall_2018/BCB410/Rview/inst/data/data_nodes.csv", header=T, as.is=T)

#==== PLOT ====#
#Using igraph's properties to define lines and nodes
net <- graph_from_data_frame(d=links, vertices=nodes, directed=T)
#Get rid off selp loops and duplicates
net <- simplify(net, remove.multiple = F, remove.loops = T)
#See what it became to
net
#make the reactions orange, proteins steelblue
mycolours <- c("steelblue", "orange")
#color them according to their type
V(net)$color <- mycolours[V(net)$node.group]


#==== INTERACTIVE NETWORK ====#
#load R API of D3
#D3 needs numeric values in order to work and it starts from 0 not 1 so subtract 1
links.d3 <- data.frame(from = match(links$from, nodes$id) - 1, to = match(links$to, nodes$id) - 1, value = 1)
#node colors
ColourScale <- 'd3.scaleOrdinal().range(["steelblue","orange"]);'
#Make the order same as source file
nodes.d3 <- cbind(idn=factor(nodes$name, levels=nodes$name), nodes)
#Click action can color the selected node to another color
myClick <- ' d3.select(this).select("circle").transition()
.style("fill", "red");'

#' A D3 Function
#'
#' This function lets user decide what to draw
#' @param graphs
#' @keywords plot interactive sankey network
#' @export
#' @examples


trial <- function(){
  answer <- readline(prompt = "Enter p to draw a plot, i to draw an interactive network and anything else but p and i for sankey networks: ")
  if (answer == "p") {
    #draw a simple non-interactive plot to check the value
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
trial()


