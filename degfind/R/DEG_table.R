DEG_table <- function(topTable, my_DEGs, save = FALSE, filename = "degtable.csv") {

  if(class(topTable) != "data.frame")
    stop("The input top_table is not a data frame.")

  if(class(my_DEGs) != "character" || !is.vector(my_DEGs))
    stop("The input DEGs are not a character vector.")

  if(!is.logical(save))
    stop("save is not TRUE or FALSE")

  topTable.t <- as_tibble(topTable, rownames = "geneID")
  DEG_table.t <- filter(topTable.t, geneID %in% my_DEGs)
  if (save) {
    write.csv(DEG_table.t, file = filename)
  }
  return(DEG_table.t)
}
