# Import datasets
authors <- read.csv("authors.csv")
books <- read.csv("books.csv")

# The Writer
books[books$author == "Mia Morgan", ]$title

# The Musician
books[books$year == 1613 & books$topic == "Music", ]$title

# The Traveler
books[books$year == 1775 & (books$author == "Lysandra Silverleaf" | books$author == "Elena Petrova"), ]$title

# The Painter
books[books$topic == "Art" & books$pages %in% 200:300 & (books$year == 1990 | books$year == 1992), ]$title

# The Scientist
books[grepl("Quantum Mechanics", books$title), ]$title

# The Teacher
zenthia_authors <- authors[authors$hometown == "Zenthia", ]$author
books[books$year %in% 1700:1799 & books$author %in% zenthia_authors, ]$title
