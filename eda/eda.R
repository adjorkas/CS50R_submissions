# Data from https://datadryad.org/stash/dataset/doi:10.5061/dryad.r2280gbdd

library("tidyverse")

# Load and tidy up data
df <- read_csv("data.csv")[,-1]
colnames(df) <- c("parent", "age", "sex", "symptoms", "language",
                  "cognitive_functioning", "communication", "emotional_regulation",
                  "social_interaction", "stereotypes", "behavioral_problems",
                  "restricted_interests", "autonomies", "tv", "videogames",
                  "online_gaming", "social_networks")
df$parent <- factor(df$parent, labels = c("mother", "father"))
df$sex <- factor(df$sex, labels = c("male", "female"))
df$symptoms <- factor(df$symptoms, labels = c("low", "medium", "high"))
df$language <- factor(df$language, labels = c("no language", "single words", "short sentences", "complex sentences"))
df$cognitive_functioning <- factor(df$cognitive_functioning, labels = c("low", "medium", "high"))
df$communication <- factor(df$communication, labels = c("improved", "same", "worsened"))
df$emotional_regulation <- factor(df$emotional_regulation, labels = c("improved", "same", "worsened"))
df$social_interaction <- factor(df$social_interaction, labels = c("improved", "same", "worsened"))
df$stereotypes <- factor(df$stereotypes, labels = c("improved", "same", "worsened"))
df$behavioral_problems <- factor(df$behavioral_problems, labels = c("improved", "same", "worsened"))
df$restricted_interests <- factor(df$restricted_interests, labels = c("improved", "same", "worsened"))
df$autonomies[which(df$autonomies == 0)] = 1
df$autonomies <- factor(df$autonomies, labels = c("improved", "same", "worsened"))
df$tv <- factor(df$tv, labels = c("never", "sometimes", "a lot"))
df$videogames <- factor(df$videogames, labels = c("never", "sometimes", "a lot"))
df$online_gaming[which(df$online_gaming > 2)] = 2
df$online_gaming <- factor(df$online_gaming, labels = c("never", "sometimes", "a lot"))
df$social_networks[which(df$social_networks > 2)] = 2
df$social_networks <- factor(df$social_networks, labels = c("never", "sometimes", "a lot"))

# Organize data to graph
df_long <- df[,c(3, 7:11, 13)] |>
  pivot_longer(cols = -sex,
               names_to = "variable",
               values_to = "outcome") |>
  filter(!is.na(outcome)) |>
  group_by(variable, sex) |>
  count(outcome, sort = TRUE)

# Make a named vector to label facets in graph
labels <- c("communication" = "Communication",
            "autonomies" = "Autonomies",
            "stereotypes" = "Stereotypes",
            "behavioral_problems" = "Behavioral Problems",
            "emotional_regulation" = "Emotional Regulation",
            "social_interaction" = "Social Interaction")

# Graph
p <- ggplot(df_long, aes(fill = sex, x = outcome, y = n)) +
  facet_wrap(~ variable, # make a graph per variable
             labeller = labeller(variable = labels)) +
  geom_bar(position = "stack", stat = "identity") +
  labs(title = "Characteristics during lockdown of children with ASD",
       x = "Changes",
       y = "Number of children") +
  scale_fill_manual(values = c("royalblue3", "palevioletred3")) +
  theme_minimal()

# Save graph
ggsave("visualization.png", plot = p, width = 2500, height = 1800, units = "px")
