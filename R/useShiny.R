# useShiny.R
#Purpose:To draw a visual representation using SHiny
#Version:1.0
#Date:December 5th, 2018
#Author:Doga Ister
#
#Dependencies: networkD3, Shiny
# ==============================================================================

# === Libraries that are used ===#
library(networkD3)
library(shiny)

#' Shiny
#'
#' This function lets user work with Shiny.
#' It can be called from draw.R.
#' User can use the function draw() and type 'shiny' \cr
#' to answer the question to activate Shiny.
#' Shiny is set to show only interactive and Sankey networks.
#'
#' @return Shiny Representaion
#'
#' @usage
#' useShiny()
#'
#' @importFrom shiny shinyApp
#'
#' @export
useShiny <-
function(){
  shinyApp(ui = ui, server = server)
}
