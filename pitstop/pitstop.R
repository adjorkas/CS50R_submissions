csv_name <- readline(".csv to analyze: ")
csv <- read.table(csv_name, sep = ",", header = TRUE)

pit_stops <- nrow(csv)
shortest <- min(csv$time)
longest <- max(csv$time)
total_time <- sum(csv$time)

print(paste0("The total number of pit stops: ", pit_stops))
print(paste0("The duration of the shortest pit stop: ", shortest))
print(paste0("The duration of the longest pit stop: ", longest))
print(paste0("The total time spent on pit stops during the race, across all racers: ", total_time))
