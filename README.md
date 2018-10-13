# rview

Some useful keyboard shortcuts for package authoring:

* Build and Reload Package:  `Cmd + Shift + B`
* Update Documentation:      `Cmd + Shift + D` or `devtools::document()`
* Test Package:              `Cmd + Shift + T`
* Check Package:             `Cmd + Shift + E` or `devtools::check()`

Load the package (outside of this project) with:
    `devtools::install_github("DogaIster/Rview")`


I am designing a generic interactive metabolic pathway viewer with a hover over pop-up information window and that the nodes (E.g. can be protein, enzyme etc.) can be moved around by the user. 
The biggest difference in my project will be the representation, I will use nodes instead of using boxes like it is commonly used and the required data except the name will appear on a popup window.
