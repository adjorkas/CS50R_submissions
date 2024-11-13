describe("make_lm()", {

  it("returns a list of two elements", {
    load("RData/expression.RData")
    load("RData/study_design.RData")
    lm <- make_lm(expression, study_design, "L_UC", "control")
    expect_equal(is.list(lm), TRUE)
    expect_equal(length(lm), 2)
  })

  it("rejects incorrect phenotypes", {
    load("RData/expression.RData")
    load("RData/study_design.RData")
    expect_error(make_lm(expression, study_design, "hello!", "control"))
    expect_error(make_lm(expression, study_design, "L_UC", "i'm a duck"))
  })
})