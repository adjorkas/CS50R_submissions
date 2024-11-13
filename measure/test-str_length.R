library(stringr)
library(testthat)

test_that("'str_length' returns an 'int' when used correctly", {
  expect_equal(is.integer(str_length("Hello, my name is Sherlock")), TRUE)
  expect_equal(is.integer(str_length(rownames(mtcars)[3])), TRUE)
  expect_equal(is.integer(str_length(as.character(21))), TRUE)
})

test_that("'str_length' handles data frames correctly", {
  expect_warning(str_length(mtcars))
  expect_warning(str_length(data.frame(c(1,2,3), c(2,3,4))))
  expect_warning(str_length(read.csv(file = "data.csv", header = TRUE)))

})

test_that("'str_length' can handle Inf, -Inf, and NaN", {
  expect_equal(str_length(Inf), 3)
  expect_equal(str_length(NaN), 3)
  expect_equal(str_length(-Inf), 4)
})

test_that("'str_length' can handle vectors", {
  expect_equal(is.vector(str_length(c(2, 34, 322))), TRUE)
  expect_equal(is.vector(str_length(airquality[,3])), TRUE)
  expect_equal(is.vector(str_length(read.csv(file = "data.csv", header = TRUE)[,2])), TRUE)
})
