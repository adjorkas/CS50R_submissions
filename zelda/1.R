library(tidyverse)

zelda <- read_csv("zelda.csv")

# Split "release" column into year and system columns
release <- str_split(zelda$release, ' - ', 2)
zelda$year <- 0
zelda$system <- 0
for (row in 1:nrow(zelda)){
  zelda$year[row] <- release[[row]][1]
  zelda$system[row] <- release[[row]][2]
}
zelda$release <- NULL

# Separate names into jobs (directors, artists, etc...)
zelda <- pivot_wider(
  zelda,
  names_from = role, # future columns
  values_from = names # future cells in rows under columns
)
colnames(zelda) <- str_to_lower(colnames(zelda))

save(zelda, file = "zelda.RData")
