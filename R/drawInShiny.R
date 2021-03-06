# drawInShiny.R
# Purpose:To draw a visual representation in Shiny.
# Version:1.0
# Date:December 1st, 2018
# Author:Doga Ister
#
# Dependencies: shiny, networkD3
# Reference: https://github.com/christophergandrud/networkD3-shiny-example/blob/master/app.R
# =============================================================================

# === Libraries that are used ===#
library(networkD3)
library(shiny)

# === Server ===#
server <- function(input, output) {

  #Since Shiny uses networkD3 interactive setups are needed here as well.
  intSet <- interactiveSet()
  links.d3 <- intSet$links.d3
  nodes.d3 <- intSet$nodes.d3

  #This is for rendering the interactive network with opacity set in Shiny.
  output$interactive <- renderForceNetwork({
    forceNetwork(
      Links = links.d3,
      Nodes = nodes.d3,
      Source="from",
      Target="to",
      NodeID = "name",
      Group = "node.type",
      linkColour = "#afafaf",
      colourScale = JS("d3.scaleOrdinal(d3.schemeCategory10);"),
      opacity = input$opacity)
  })
  #This is for rendering the sankey network with sinks choice in Shiny.
  output$sankey <- renderSankeyNetwork({
    sankeyNetwork(
      Links = links.d3,
      Nodes = nodes.d3,
      Source = "from",
      Target = "to",
      Value = "value",
      NodeID = "name",
      fontSize = 16,
      nodeWidth = 30,
      sinksRight = input$sinksRight)
  })
}

# === Client ===#

ui <- shinyUI(fluidPage(
  titlePanel("Shiny Representation "),
  sidebarLayout(
    sidebarPanel(
      #numericInput is used instead sliderInput in order to make this work
      #with Sankey networks as well.
      numericInput("opacity", "Opacity", 0.6, min = 0.1, max = 1, step = .1)
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Interactive Network", forceNetworkOutput("interactive")),
        tabPanel("Sankey Network",
                 checkboxInput("sinksRight", "Sinks Right", value = TRUE),
                 sankeyNetworkOutput("sankey"))
      )
    )
  )
))

# [END]
