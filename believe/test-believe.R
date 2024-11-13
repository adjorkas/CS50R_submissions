library(testthat)
source("believe.R")

test_that("generate_comparison_plot creates graph.png", {
  generate_comparison_plot(2023)
  expect_true(file.exists("graph.png"))
})

test_that("generate_comparison_plot correctly handles invalid years, Inf, -Inf, and NaN", {
  expect_error(generate_comparison_plot(12))
  expect_error(generate_comparison_plot(2013))
  expect_error(generate_comparison_plot(Inf))
  expect_error(generate_comparison_plot(-Inf))
  expect_error(generate_comparison_plot(NaN))
})

test_that("generate_comparison_plot correctly handles NA and strings", {
  expect_error(generate_comparison_plot(NA))
  expect_error(generate_comparison_plot("Hello!"))
  expect_error(generate_comparison_plot(rownames(mtcars)[3]))
})

test_that("generate_comparison_plot correctly handles vectors", {
  expect_error(generate_comparison_plot(c(1, 2, 3)))
  expect_error(generate_comparison_plot(generate_comparison_plot(mtcars[,1])))
})
