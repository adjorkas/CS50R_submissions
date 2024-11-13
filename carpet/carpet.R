calculate_growth_rate <- function(years, visitors) {
  # Calculate yearly growth of visitors
  (visitors[length(visitors)] - visitors[1]) / (years[length(years)] - years[1])
}

predict_visitors <- function(years, visitors, year) {
  # Predict visitors in given year
  growth_rate <- calculate_growth_rate(years, visitors)
  visitors[length(visitors)] + (growth_rate * (year - years[length(years)]))
}

visitors <- read.csv("visitors.csv")
year <- as.integer(readline("Year: "))
predicted_visitors <- predict_visitors(visitors$year, visitors$visitors, year)
cat(paste0(predicted_visitors, " million visitors.\n"))
