describe("DEG_table()", {

  it("handles wrong input", {
    load("RData/top_table.RData")
    load("RData/my_DEGs.RData")
    expect_error(DEG_table("a", my_DEGs))
    expect_error(DEG_table(top_table, mtcars))
  })

  it("saves default degtable.csv", {
    load("RData/top_table.RData")
    load("RData/my_DEGs.RData")
    DEG_table(top_table, my_DEGs, save = TRUE)
    expect_equal(file.exists("degtable.csv"), TRUE)
    unlist("degtable.csv")
  })

  it("saves default degtable.csv", {
    load("RData/top_table.RData")
    load("RData/my_DEGs.RData")
    DEG_table(top_table, my_DEGs, save = TRUE, filename = "myfile.csv")
    expect_equal(file.exists("myfile.csv"), TRUE)
    unlink("myfile.csv")
  })
})