describe("DEGs()", {

  it("can reject wrong input types", {
    load("RData/lm_stats.RData")
    expect_error(DEGs(lm_stats, venn = "a"))
    expect_error(DEGs(lm_stats, p.value = "a"))
    expect_error(DEGs(lm_stats, lfc = "a"))
    expect_error(DEGs(mtcars))
  })

  it("prints number of found DEGs", {
    load("RData/lm_stats.RData")
    n <- length(DEGs(lm_stats))
    x <- capture.output(invisible(DEGs(lm_stats, print = TRUE)))
    expect_equal(is.numeric(n), TRUE)
    expect_match(x, paste("Number of DEGs is", n), fixed = TRUE)
    })

  it("returns a character vector", {
    load("RData/lm_stats.RData")
    output <- DEGs(lm_stats)
    expect_equal(is.vector(output), TRUE)
    expect_equal(class(output) == "character", TRUE)
  })
})