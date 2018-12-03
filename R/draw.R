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
#'

draw <- function(){

  #interactive setups should be done to draw an interactive network
  intSet <- interactiveSet()
  links.d3 <- intSet$links.d3
  nodes.d3 <- intSet$nodes.d3
  ColourScale <- intSet$ColourScale
  myClick <- intSet$myClick

  print("Available options: p: plot, l: just labels, i: interactive network, s sankey network, shiny to use the Shiny library")
  answer <- readline(prompt = "Enter p to draw a plot, i for interactive network, s for sankey network, l for 'just' labels or shiny to work on shiny: ")
  if (answer == "p") {
    print("Plot setups are ready")
    #draw a simple non-interactive plot
    plot(networkPlot, edge.arrow.size=.4, edge.curved=.4, vertex.frame.color="#ffffff")
  } else if (answer == "l") {
    plot(networkPlot, vertex.shape="none", vertex.label.font=2, vertex.label.color="black", vertex.label.cex=.8, edge.arrow.size=.3, edge.curved=.2)
  } else if (answer == "i") {
            forceNetwork(
                 Links = links.d3,
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
  } else if(answer == "shiny") {
    useShiny()
  } else{
    print("Please choose a valid option")
    print("Valid options: 1) i 2) s 3) p 4) l 5) shiny")
  }
}

# [END]
