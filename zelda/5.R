load("zelda.RData")

zelda <- zelda |>
  filter(grepl(",", producers)) |>
  group_by(title) |>
  slice_min(order_by = year) |>
  arrange(year, title, system) |>
  ungroup()

save(zelda, file = "5.RData")
