plot_data_quality <- function(expression, filename = "dataquality.png", print = FALSE) {

  expression.t <- as_tibble(expression, rownames = "geneID")

  expression.tp <- expression.t %>%
    pivot_longer(cols = 2:ncol(expression.t),
                 names_to = "samples",
                 values_to = "expression")

  eplot <- ggplot(expression.tp) +
    aes(x = samples, y = expression, fill = samples) +
    geom_violin(trim = FALSE, show.legend = FALSE) +
    stat_summary(fun = "median",
                 geom = "point",
                 shape = 95,
                 size = 10,
                 color = "black",
                 show.legend = FALSE) +
    labs(y = "log2 fluorescence values",
         x = "sample",
         title = "Expression data") +
    scale_x_discrete(guide = guide_axis(angle = 90)) +
    theme_bw()

  ggsave(filename, eplot, width = 8, height = 5)

  if(print) {
    print(eplot)
  }
}
