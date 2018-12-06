#welcome.R
#Package startup and unload functions

# === Libraries that are used ===#
library("roxygen2")
library("igraph")
library("networkD3")
library("shiny")

.onLoad <- function(libname, pkgname) {
    invisible()
}

.onAttach <- function(libname, pkgname) {
    # Startup message
    m <- character()
    m[1] <- "\nWelcome to rview.\n"

    packageStartupMessage(paste(m, collapse = ""))
}

# [END]
