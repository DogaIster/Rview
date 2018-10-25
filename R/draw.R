# draw.R
#
# Purpose:To draw a visual representation.
# Version:1.0
# Date:October 25th, 2018
# Author:Doga Ister
#
# Dependencies: igraph, networkD3
# ==============================================================================

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
