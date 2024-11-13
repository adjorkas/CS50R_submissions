library("tidyverse")

filename <- "lyrics/rumbling.txt"
vector <- read_file(filename) |>
  str_replace_all("[^A-Za-z0-9']", " ") |> # remove all but letters, numbers, and "'"
  str_squish() |>
  str_to_lower() |>
  str_split_1(pattern = " ")

df <- tibble(word = vector) |>
  group_by(word) |>
  summarize(count = n()) |>
  arrange(desc(count)) |>
  filter(count > 1) |>
  ungroup()

# Factoring makes the column an ordered list of categories
# This affects how the bars are displayed and colored in ggplot
# To undo the factoring: df$word <- as.character(df$word)
df$word <- factor(df$word, levels = df$word)

p <- ggplot(df, aes(x = word, y = count)) +
  geom_col(aes(fill = word), show.legend = FALSE) +
  labs(title = paste0("Word count for ", filename),
       subtitle = "Note: words that appear only once are not shown.",
       x = "Word",
       y = "Count") +
  scale_fill_manual(values = rainbow(nrow(df))) +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.3))

ggsave("lyrics.png", plot = p)
