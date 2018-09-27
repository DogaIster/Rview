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

install.packages("igraph")
#install.packages("network")
install.packages("networkD3")
#install.packages("sna")
#install.packages("visNetwork")
#install.packages("threejs")
#install.packages("ndtv")

#if (! require(networkD3, quietly=TRUE)) {
#  install.packages("networkD3")
#  library(networkD3)
#}

# ====  FUNCTIONS  =============================================================
#Load the data
links <- read.csv("/Users/dogaister/Desktop/Courses/Fall_2018/BCB410/Rview/data_edges.csv", header=T, as.is=T)
#see the first few to make sure
head(nodes)
head(links)
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
V(net)$color <- mycolours[V(net)$node.type]
#draw a simple non-interactive plot to check the value
plot(net, edge.arrow.size=.4, edge.curved=.4, vertex.label=NA, vertex.frame.color="#ffffff") #don't forget to get the labels back

#load R API of D3
library("networkD3")
#D3 needs numeric values in order to work and it starts from 0 not 1 so subtract 1
links.d3 <- data.frame(from=as.numeric(factor(links$from))-1,
                       to=as.numeric(factor(links$to))-1 )

#node colors
ColourScale <- 'd3.scaleOrdinal().range(["steelblue","#FF6900"]);'
#Make the order same as source file
nodes.d3 <- cbind(idn=factor(nodes$name, levels=nodes$name), nodes)
#D3 property
forceNetwork(Links = links.d3, Nodes = nodes.d3, Source="from", Target="to",
             NodeID = "name", Group = "node.type", linkWidth = 1, linkColour = "#afafaf",
             fontSize=12, zoom=T, colourScale = JS(ColourScale), legend=T,
             opacity = 0.8, charge=-300, arrows = FALSE, bounded = FALSE, opacityNoHover = 1,
             width = NULL, height = NULL)

