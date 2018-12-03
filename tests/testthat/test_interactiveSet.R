#test_interactiveSet

context("Testing interactive and sankey network setups")

intSet <- interactiveSet()
links.d3.name <- intSet$links.d3$source
nodes.d3.name <- intSet$nodes.d3$name
ColourScale <- intSet$ColourScale
myClick <- intSet$myClick

test_that("Data interactive function create the d3 data without distrupting", {
  expect_equal(myClick,  " d3.select(this).select(\"circle\").transition().style(\"fill\", \"red\");")
  expect_equal(ColourScale, "d3.scaleOrdinal().range([\"steelblue\",\"orange\"]);")
  expect_equal(intSet$nodes.d3$name, nodes$name)
  expect_equal(intSet$links.d3$source, links$source)
})

# [END]



