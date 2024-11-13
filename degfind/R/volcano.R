volcano <- function(tt, DEGs, plot = FALSE, filename = "volcano.png") {

  if(class(tt) != "data.frame")
    stop("The input top_table is not a data frame.")

  if(class(DEGs) != "character" || !is.vector(DEGs))
    stop("The input DEGs are not a character vector.")

  # Volcano Plot: logFC/p-value
  topTable.t <- as_tibble(tt, rownames = "geneID")

  volcano <- ggplot(topTable.t) +
    aes(y = -log10(adj.P.Val), x = logFC, text = paste("Symbol:", geneID), customdata = geneID) +
    geom_hline(yintercept = -log10(0.05), linetype = "longdash", colour = "grey", linewidth = 1) +
    geom_point(size = 2, color = ifelse(!topTable.t$geneID %in% DEGs, "grey",
                                        ifelse(topTable.t$adj.P.Val > 0.05, "grey",
                                               ifelse(topTable.t$logFC > 0, "red3", "blue3")))) +
    geom_text_repel(data = subset(topTable.t, geneID %in% DEGs), aes(label = geneID), vjust = -1) +
    theme_bw()

  ggsave(filename, volcano, width = 8, height = 5)

  if(plot) {
    print(volcano)
  }
}
