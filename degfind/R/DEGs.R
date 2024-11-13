DEGs <- function(stats, venn = TRUE, p.value = 0.05, lfc = 1, print = FALSE) {

  if(!is.numeric(p.value))
    stop("p.value is not numeric")

  if(!is.numeric(lfc))
    stop("lfc is not numeric")

  if(!is.logical(venn))
    stop("venn is not TRUE or FALSE")

  if(class(stats) != "MArrayLM")
    stop("Input is not of MArrayLM class")

  # Pull out the most relevant DEGs. P.value and lfc are arbitrary cutoffs
  decide_tests <- decideTests(stats, method = "global", adjust.method = "BH",
                              p.value = p.value, lfc = lfc)

  my_DEGs <- rownames(decide_tests)[which(decide_tests[, 1] != 0)]

  if (print) {
    cat(paste("Number of DEGs is", length(my_DEGs)))
  }

  # Venn diagrams
  if(venn) {
    vennDiagram(decide_tests,
                include = c("up", "down"),
                counts.col=c("red3", "blue3"),
                circle.col = "grey10",
                show.include = TRUE)
  }

  return(my_DEGs)
}
