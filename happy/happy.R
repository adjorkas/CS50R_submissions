df_2020 <- read.csv("2020.csv")
df_2021 <- read.csv("2021.csv")
df_2022 <- read.csv("2022.csv")
df_2023 <- read.csv("2023.csv")
df_2024 <- read.csv("2024.csv")

countries <- unique(rbind(df_2020, df_2021, df_2022, df_2023, df_2024)$country)
selection <- readline("Country: ")

for (year in 2020:2024) {
  df <- get(paste0("df_", year))
  if (selection %in% countries) {
    df <- subset(df, country == selection)
    result <- format(round(apply(df[, -1], MARGIN = 1, FUN = sum), digits = 2), nsmall = 2)
  } else
    result <- "Data unavailable."
  cat(paste0(selection, " (", year, "): ", result, "\n"))
}
