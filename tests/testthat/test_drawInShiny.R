#test_drawInShiny

#context("Testing Shiny")

#library(RSelenium)
#library(testthat)

#remoteDriver <- rsDriver()
#remoteDriver$open(silent = FALSEc)
#appURL <- "http://127.0.0.1:4444"

#test_that("If Shiny can connect", {
#  remoteDriver$navigate(appURL)
#  title <- remoteDriver$getTitle()[[1]]
#  expect_equal(title, "Shiny Representation")
#})

#remoteDriver$close()
