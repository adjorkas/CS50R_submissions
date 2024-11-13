load("air.RData")

air <- air |>
  select(pollutant, emissions) |>
  group_by(pollutant) |>
  summarize(sum(emissions)) |>
  rename(emissions = "sum(emissions)") |>
  arrange(desc(emissions)) |>
  ungroup()

save(air, file = "6.RData")
