gene_names <- function(expression) {
  if(class(expression) != "data.frame") {
    stop("Input is not a data frame.")
  }
  genenames <- rownames(expression)
  samplenames <- colnames(genenames)
  message(paste("Number of genes:", length(genenames)))
  return(genenames)
}
