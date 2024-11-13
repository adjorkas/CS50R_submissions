data <- read.table("tests.tsv", header = TRUE, fill = TRUE)
n <- 15

# convert categories to meaning
data$gender <- factor(
  data$gender,
  labels = c("Unanswered", "Male", "Female", "Other")
)

data$extroversion <- round(rowSums(data[, c("E1", "E2", "E3")]) / n, digits = 2)
data$neuroticism <- round(rowSums(data[, c("N1", "N2", "N3")]) / n, digits = 2)
data$agreeableness <- round(rowSums(data[, c("A1", "A2", "A3")]) / n, digits = 2)
data$conscientiousness <- round(rowSums(data[, c("C1", "C2", "C3")]) / n, digits = 2)
data$openness <- round(rowSums(data[, c("O1", "O2", "O3")]) / n, digits = 2)

write.table(data, file = "analysis.csv", sep = ",", row.names = FALSE)
