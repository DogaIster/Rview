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

setwd("/Users/dogaister/Desktop/Courses/Fall_2018/BCB410/Rview/inst/scripts")

#====  PARAMETERS  ============================================================
# Define and explain all parameters. No "magic numbers" in your code below.



# ====  PACKAGES  ==============================================================
# Load all required packages.

if (! require(igraph, quietly=TRUE)) {
  install.packages("igraph", repos="http://cran.rstudio.com/")
  library(igraph)
}

if (! require(networkD3, quietly=TRUE)) {
  install.packages("netwporkD3", repos="https://github.com/igraph/rigraph")
  library(networkD3)
}

install.packages("igraph")
install.packages("networkD3")

# ====  FUNCTIONS  =============================================================
#Load the data
links <- read.csv("/Users/dogaister/Desktop/Courses/Fall_2018/BCB410/Rview/inst/data/data_edges.csv", header=T, as.is=T)
nodes <- read.csv("/Users/dogaister/Desktop/Courses/Fall_2018/BCB410/Rview/inst/data/data_nodes.csv", header=T, as.is=T)
#see the first few rows to make sure
#head(nodes)
#head(links)

question <- prompt("Do you want to draw a plot or an interactive metabolic network?")
if( question == "Plot"){
  ########### PLOT ###########
  #Create igraph object
  library("igraph")
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
  #draw a simple non-interactive plot to check the value
  plot(net, edge.arrow.size=.4, edge.curved=.4, vertex.label=NA, vertex.frame.color="#ffffff") #don't forget to get the labels back
} else{

########### Interactive ###########
#load R API of D3
library("networkD3")
#D3 needs numeric values in order to work and it starts from 0 not 1 so subtract 1
links.d3 <- data.frame(from = match(links$from, nodes$id) - 1, to = match(links$to, nodes$id) - 1, value = 1)


#node colors
ColourScale <- 'd3.scaleOrdinal().range(["steelblue","orange"]);'
#Make the order same as source file
nodes.d3 <- cbind(idn=factor(nodes$name, levels=nodes$name), nodes)
#Click action can color the selected node to another color
myClick <- ' d3.select(this).select("circle").transition()
.style("fill", "red");'

#D3 property
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
}

