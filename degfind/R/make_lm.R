make_lm <- function(expression = NULL, study_design = NULL, phenotype1 = NULL, phenotype2 =  NULL) {

  phenotypes <- factor(study_design[["phenotype"]])

  if(!(phenotype1 %in% levels(phenotypes))) {
    stop("phenotype1 is not a valid phenotype.")}

  if(!(phenotype2 %in% levels(phenotypes))) {
    stop("phenotype2 is not a valid phenotype.")}

  # Master linear model
  lm_dmatrix <- model.matrix(~ 0 + phenotypes)
  colnames(lm_dmatrix) <- levels(phenotypes)
  rownames(lm_dmatrix) <- study_design[["sampleID"]]
  master_lm <- lmFit(expression, lm_dmatrix)

  # Contrast matrix (pairwise comparisons)
  x <- paste0(phenotype1, "-", phenotype2)
  lm_cmatrix <- makeContrasts(contrasts = x, levels = lm_dmatrix)

  # Linear model of contrasts and bayesian statistics
  lm <- contrasts.fit(master_lm, lm_cmatrix)
  lm_stats <- eBayes(lm)

  return(list(master_lm = master_lm, lm_stats = lm_stats))
}
