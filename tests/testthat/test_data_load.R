#test data_load

context("data_load")

test_that("data_load is working as expected", {
  expect_equal(data$links, links)
  expect_equal(data$nodes, nodes)
})

# [END]
