# plotSet.R
#
# Purpose:Plots set up
# Version:1.0
# Date:October 8th, 2018
# Author:Doga Ister
#==============================================================================

#' plotSet
#'
#' This function sets the required variables for plot
#' @keywords plot representation

plotSet <- function(){
  #Using igraph's properties to define lines and nodes for the plot
  plot <- graph_from_data_frame(d=links, vertices=nodes, directed=T)
  #Get rid off self loops and duplicates
  plot <- simplify(plot, remove.multiple = F, remove.loops = T)
  #make the reactions orange, proteins steelblue
  mycolours <- c("steelblue", "orange")
  #color them according to their type
  V(plot)$color <- mycolours[V(plot)$node.group]
  print("Plot setups are ready")
}

# [END]
