load("zelda.RData")

zelda <- zelda |>
  filter(grepl("Shigeru Miyamoto", producers)) |>
  group_by(title) |>
  slice_min(order_by = year) |>
  arrange(year, title, system) |>
  ungroup()

save(zelda, file = "4.RData")
