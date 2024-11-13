sample_names <- function(expression) {
  if(class(expression) != "data.frame") {
    stop("Input is not a data frame.")
  }
  samplenames <- colnames(expression)
  message(paste("Number of samples:", length(samplenames)))
  return(samplenames)
}
