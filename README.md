# rpt

## R Package Template

This is a template RStudio project for R packages, loosely based on Hadley Wickham's

  [R Packages](http://r-pkgs.had.co.nz/) <http://r-pkgs.had.co.nz/>

-----------------------------------------------

Note: you can't push empty directories to your repository. Make sure youu keep
at least one file in every directory that you want to keep during development.
 
-----------------------------------------------

Some useful keyboard shortcuts for package authoring:

* Build and Reload Package:  `Cmd + Shift + B`
* Update Documentation:      `Cmd + Shift + D` or `devtools::document()`
* Test Package:              `Cmd + Shift + T`
* Check Package:             `Cmd + Shift + E` or `devtools::check()`

-----------------------------------------------


Load the package (outside of this project) with:
    `devtools::install_github("<your user name>/<your package name>")`


I am designing a generic interactive metabolic pathway viewer with a hover over pop-up information window and that the nodes (E.g. can be protein, enzyme etc.) can be moved around by the user. 
The biggest difference in my project will be the representation, I will use nodes instead of using boxes like it is commonly used and the required data except the name will appear on a popup window.
