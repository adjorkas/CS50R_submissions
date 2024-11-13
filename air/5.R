# Keep single largest pollutant source for each county

load("air.RData")

air <- air |>
  group_by(county) |>
  slice_max(order_by = emissions) |>
  ungroup()

save(air, file = "5.RData")
