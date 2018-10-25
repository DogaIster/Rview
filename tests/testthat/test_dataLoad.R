#test dataLoad

context("dataLoad")

test_that("dataLoad is working as expected", {
  expect_equal(data$links, links)
  expect_equal(data$nodes, nodes)
})

# [END]
