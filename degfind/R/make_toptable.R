make_toptable <- function(lm_stats) {

  if(class(lm_stats) != "MArrayLM")
    stop("Input is not the correct datatype.")

  # TopTable to view DEGs
  topTable <- topTable(lm_stats, adjust = "BH", coef = 1, number = 40000) %>%
    dplyr::select(logFC, P.Value, adj.P.Val) %>%
    dplyr::mutate(rank = ifelse(logFC > 0, -log10(adj.P.Val), log10(adj.P.Val))) %>%
    dplyr::arrange(desc(rank))

  return(topTable)
}
