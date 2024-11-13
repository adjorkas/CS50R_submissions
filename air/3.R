load("2.RData")

air <- air |>
  filter(county == "OR - Curry")

save(air, file = "3.RData")
