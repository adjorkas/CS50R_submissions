describe("sample_names()", {

  it("returns an error if the input is not a data frame", {
    expect_error(sample_names("hello!"))
    expect_error(sample_names(mtcars[,3]))
  })

  it("returns a character vector", {
    load("RData/expression.RData")
    expect_equal(is.vector(sample_names(expression)), TRUE)
  })

  it("outputs message with number of samples", {
    load("RData/expression.RData")
    expect_message(sample_names(expression))
  })

  it("can extract dataframe's colnames", {
    load("RData/expression.RData")
    expect_equal(colnames(expression), sample_names(expression))
    expect_equal(class(sample_names(expression)), "character")
  })
})