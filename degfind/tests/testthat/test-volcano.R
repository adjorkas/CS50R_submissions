describe("volcano()", {

  it("handles wrong input", {
    expect_error(volcano("hello!"))
    expect_error(volcano(mtcars, 2))
  })

  it("saves volcano.png by default", {
    load("RData/top_table.RData")
    load("RData/my_DEGs.RData")
    volcano(top_table, my_DEGs)
    expect_equal(file.exists("volcano.png"), TRUE)
    unlink("volcano.png")
  })

  it("saves a graph with your chosen filename", {
    load("RData/top_table.RData")
    load("RData/my_DEGs.RData")
    out <- volcano(top_table, my_DEGs, plot = FALSE, filename = "mygraph.png")
    expect_equal(file.exists("mygraph.png"), TRUE)
    unlink("mygraph.png")
  })
})