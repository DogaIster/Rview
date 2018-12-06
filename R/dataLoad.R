# data_load.R Purpose:To load the desired .csv data files Version:1.0 Date:October 25th, 2018 Author:Doga Ister Output: [1] 'Example
# data for edges is loaded' [1] 'Example data for nodes is loaded' Dependencies:N/A
# =========================================================================

#' Load data
#'
#' This function loads the example data.
#' If user replaces example data with the desired data, it will load user's data.
#'
#' @return None
#'
#' @usage
#' data_load()
#'
#' @importFrom utils read.csv
#'
#' @export
#'

data_load <- function() {
    data <- data_load
    # data for edges
    edgesCSV <- (system.file("extdata", "data_edges.csv", package = "rview"))
    #reading the CSV for edges
    links <- read.csv(edgesCSV, header = T, as.is = T)
    print("Data for edges is loaded")
    # data for nodes
    nodesCSV <- (system.file("extdata", "data_nodes.csv", package = "rview"))
    #reading the CSV for nodes
    nodes <- read.csv(nodesCSV, header = T, as.is = T)
    print("Data for nodes is loaded")

    return(list(links = links, nodes = nodes))
}

# [END]
