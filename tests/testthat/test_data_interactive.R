#test_data_interactive

context("data_interactive")


test_that("Data interacrtive function create the d3 data without distrupting", {
  expect_equal(data_int$myClick, " d3.select(this).select(\"circle\").transition()\n  .style(\"fill\", \"red\");")
  expect_equal(data_int$ColourScale, "d3.scaleOrdinal().range([\"steelblue\",\"orange\"]);")
  expect_equal(data_int$nodes.d3$name, nodes$name)
  expect_equal(data_int$links.d3$source, links$source)
})

# [END]



