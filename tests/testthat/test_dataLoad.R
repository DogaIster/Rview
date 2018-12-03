#test dataLoad

context("Testing dataLoad")

intSet <- interactiveSet()
links.d3 <- intSet$links.d3
nodes.d3 <- intSet$nodes.d3
ColourScale <- intSet$ColourScale
myClick <- intSet$myClick

test_that("dataLoad is working as expected", {
  expect_equal(data$links, links)
  expect_equal(data$nodes, nodes)
  expect_equal(links.d3, intSet$links.d3)
  expect_equal(nodes.d3, intSet$nodes.d3)
})

# [END]
