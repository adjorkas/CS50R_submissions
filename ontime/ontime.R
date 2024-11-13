rail <- read.csv("rail.csv")
bus <- read.csv("bus.csv")
df <- rbind(rail, bus)
selection <- readline("Route: ")

if (!selection %in% df$route) {
  print("Invalid route.")
} else {

  peak <- subset(df, peak == "PEAK" & route == selection)
  peak <- round(mean(peak$numerator / peak$denominator), digits = 2) * 100

  off_peak <- subset(df, !peak == "PEAK" & route == selection)
  off_peak <- round(mean(off_peak$numerator / off_peak$denominator), digits = 2) * 100

  print(paste0("On time ", peak, "% of the time during peak hours."))
  print(paste0("On time ", off_peak, "% of the time during off-peak hours."))
}
