load("zelda.RData")

zelda <- zelda |>
  select(title, year) |>
  group_by(year) |>
  summarize(releases = n()) |>
  arrange(desc(releases))

save(zelda, file = "2.RData")
