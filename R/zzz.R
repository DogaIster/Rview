# zzz.R
#
# Package startup and unload functions

#=== Libraries that are used ===#
library("roxygen2")
library("igraph")
library("networkD3")

.onLoad <- function(libname, pkgname) {

    # # Make list of package parameters and add to global options
    #
    # # filepath of logfile
    # optRpt <- list(rpt.logfile = logFileName() )
    #
    # # add more options ...
    # optRpt[["nameOfOption"]] <- value
    #
    # optionsToSet <- !(names(optRpt) %in% names(options()))
    #
    # if(any(optionsToSet)) {
    #     options(optShi[optionsToSet])
    # }

    invisible()
}


.onAttach <- function(libname, pkgname) {
  # Startup message
  m <- character()
  m[1] <- "\nWelcome to rview.\n"

  packageStartupMessage(paste(m, collapse=""))
}


# .onUnload <- function(libname, pkgname) {
#
# }



# [END]
