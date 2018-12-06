#interactiveSet.R
#Purpose:Plots and interactive network set up
#Version:1.0
#Date:September 24th, 2018
#Author:Doga Ister
#
#Dependencies: N/A
# =============================================================================

#' interactiveSet
#'
#' This function sets the required D3 variables for the interactive network view.
#'
#' @param interactiveSet A function
#'
#' @return None

interactiveSet <- function() {
  # D3 needs numeric values to work and it starts from 0 so, I subtract 1
  links.d3 <- data.frame(from = match(links$from, nodes$id) - 1,
                         to = match(links$to, nodes$id) - 1, value = 1)
  # Node colors for interactive networks
  ColourScale <- "d3.scaleOrdinal().range([\"steelblue\",\"orange\"]);"
  # Make the order same as source file
  nodes.d3 <- cbind(idn = factor(nodes$name, levels = nodes$name), nodes)
  # Click action can color the selected node to another color, red in this case
  myClick <- " d3.select(this).select(\"circle\").transition()
                 .style(\"fill\", \"red\");"
  # Notify user that setups are ready to use
  print("Interactive network setups are ready")
  return(list(links.d3 = links.d3, nodes.d3 = nodes.d3,
              ColourScale = ColourScale, myClick = myClick))
}

# [END]
