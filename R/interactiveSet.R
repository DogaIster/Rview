# interactiveSet.R
#
# Purpose:Plots and interactive network set up
# Version:1.0
# Date:September 24th, 2018
# Author:Doga Ister
#==============================================================================

#' interactiveSet
#'
#' This function sets the required D3 variables for the interactive network view
#' @param interactiveSet A function
#' @keywords interactive network D3 networkD3

interactiveSet <- function(){
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
intSet=interactiveSet()
links.d3=intSet$links.d3
nodes.d3=intSet$nodes.d3
ColourScale=intSet$ColourScale
myClick=intSet$myClick

# [END]
