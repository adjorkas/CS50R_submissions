describe("plot_data_quality()", {

  it("can generate dataquality.png", {
    load("RData/expression.RData")
    plot_data_quality(expression)
    expect_equal(file.exists("dataquality.png"), TRUE)
    unlink("dataquality.png")  # Clean up the generated file
  })

  it("can generate a file with the name you choose", {
    load("RData/expression.RData")
    plot_data_quality(expression, "myfile.png")
    expect_equal(file.exists("myfile.png"), TRUE)
    unlink("myfile.png")  # Clean up the generated file
  })
})

