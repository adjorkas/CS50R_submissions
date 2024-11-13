describe("gene_names()", {

  it("returns an error if the input is not a data frame", {
    expect_error(gene_names("hello!"))
    expect_error(gene_names(mtcars[,3]))
  })

  it("returns a character vector", {
    load("RData/expression.RData")
    expect_equal(is.vector(gene_names(expression)), TRUE)
  })

  it("outputs message with number of genes", {
    load("RData/expression.RData")
    expect_message(gene_names(expression))
  })

  it("can extract dataframe's rownames", {
    load("RData/expression.RData")
    expect_equal(rownames(expression), gene_names(expression))
    expect_equal(class(gene_names(expression)), "character")
  })
})