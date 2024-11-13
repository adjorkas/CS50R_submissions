load("air.RData")

air <- air |>
  select(level_1, pollutant, emissions) |>
  rename(source = level_1) |>
  group_by(source, pollutant) |>
  summarize(sum(emissions)) |>
  rename(emissions = "sum(emissions)") |>
  arrange(source, pollutant) |>
  ungroup()

save(air, file = "7.RData")
