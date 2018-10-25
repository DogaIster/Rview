#test_interactiveSet

context("interactiveSet")


test_that("Data interacrtive function create the d3 data without distrupting", {
  expect_equal(intSet$myClick, " d3.select(this).select(\"circle\").transition()\n  .style(\"fill\", \"red\");")
  expect_equal(intSet$ColourScale, "d3.scaleOrdinal().range([\"steelblue\",\"orange\"]);")
  expect_equal(intSet$nodes.d3$name, nodes$name)
  expect_equal(intSet$links.d3$source, links$source)
})

# [END]



