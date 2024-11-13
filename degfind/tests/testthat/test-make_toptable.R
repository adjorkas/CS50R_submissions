describe("make_toptable()", {

  it("rejects data that is not MArrayLM", {
    expect_error(make_toptable(2))
  })

  it("returns toptable", {
    load("RData/lm_stats.RData")
    expect_equal(class(make_toptable(lm_stats)) == "data.frame", TRUE)
  })

  it("returns the correct colnames", {
    load("RData/lm_stats.RData")
    names <- c("logFC", "P.Value", "adj.P.Val", "rank")
    expect_equal(all(colnames(make_toptable(lm_stats)) %in% names), TRUE)
  })
})