load("air.RData")

air <- air |>
  filter(county == "OR - Curry") |>
  arrange(desc(emissions))

save(air, file = "4.RData")
