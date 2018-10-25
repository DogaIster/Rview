# network.R
#
# Purpose:To draw a visual representation.
# Version:1.0
# Date:September 24th, 2018
# Author:Doga Ister
#
# Dependencies: igraph, networkD3
# ==============================================================================

#=== Libraries that are used ===#
library("devtools")
library("roxygen2")
library("igraph")
library("networkD3")

#==== FUNCTIONS ====#

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
#'
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

#' Draw Function
#'
#' This function lets user decide what kind of visual representation
#' they want to use, for now it is limited to
#' plot, interactive networks and sankey network
#' @return the graph
#' @export

draw <- function(){
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
  } else if (answer == "s") {
    sankeyNetwork(Links = links.d3, Nodes = nodes.d3, Source = "from", Target = "to",
                  NodeID = "name", Value = "value", fontSize = 16, unit = "Letter(s)" )
  } else{
    print("Please choose a valid option")
    print("Valid options: 1) i 2) p 3) s")
  }
}

# [END]
