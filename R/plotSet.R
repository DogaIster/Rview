# plotSet.R
#
# Purpose:Plots set up
# Version:1.0
# Date:October 8th, 2018
# Author:Doga Ister
#==============================================================================

#' plotSet
#'
#' This file sets the required variables for plot
#' @keywords plot representation

  igraphLib <- library(igraph)
  #Using igraph's properties to define lines and nodes for the plot
  networkPlot <- graph_from_data_frame(d=links, vertices=nodes, directed=T)
  #Get rid off self loops and duplicates
  networkPlot <- simplify(networkPlot, remove.multiple = F, remove.loops = T)
  #make the reactions orange, proteins steelblue
  mycolours <- c("steelblue", "orange")
  #color them according to their type
  V(networkPlot)$color <- mycolours[V(networkPlot)$node.group]

# [END]
