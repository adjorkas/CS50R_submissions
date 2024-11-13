# Data from: https://www.statistik.at/en/statistics/population-and-society/population/families-households-living-arrangements/family-types
# Believe.R was made by chatgpt in order to fulfill CS50R - NOT my code! (I wrote fixes to pass the tests, though)
# Example usage: generate_comparison_plot(2023)

# Load necessary libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Function to read data and set column names
read_and_process_data <- function() {
  # Create the data frame directly using data.frame() and c()
  df <-   data.frame(
    family_type = c(
      "Total number of families",
      "Families without children in household",
      "Families with children in household",
      "Families with children under 15 years in household",
      "All couples",
      "Couples without children in household",
      "Couples with children in household",
      "Couples with children under 15 years in household",
      "Married couples",
      "Married couples without children in household",
      "Married couples with children in household",
      "Married couples with children under 15 years in household",
      "Consensual unions",
      "Consensual unions without children in household",
      "Consensual unions with children in household",
      "Consensual unions with children under 15 years in household",
      "Lone parent families",
      "Lone parent families with children under 15 years in household",
      "Lone mother families",
      "Lone mother families with children under 15 years in household",
      "Lone father families",
      "Lone father families with children under 15 years in household"
    ),
    "1985" = c(2051800, 651300, 1400400, 834700, 1782800, 651300, 1131400, 721000, 1710100, 605900, 1104100, 699800, 72700, 45400, 27300, 21200, 269000, 113700, 235400, 102900, 33600, 10900),
    "1995" = c(2223100, 766800, 1456300, 866600, 1936600, 766800, 1169800, 742800, 1768000, 666800, 1101200, 686400, 168600, 99900, 68600, 56400, 286500, 123800, 250700, 115400, 35800, 8400),
    "2005" = c(2290800, 881400, 1409300, 813900, 1985300, 881400, 1103800, 687600, 1692500, 721800, 970700, 582300, 292800, 159700, 133100, 105300, 305500, 126400, 259200, 116700, 46300, 9700),
    "2015" = c(2389100, 998400, 1390700, 759500, 2092900, 998400, 1094400, 651600, 1713400, 782400, 931000, 517900, 379500, 216100, 163400, 133700, 296200, 108000, 251100, 101300, 45100, 6600),
    "2020" = c(2459900, 1063200, 1396700, 778600, 2171500, 1063200, 1108300, 674600, 1751000, 827600, 923400, 524000, 420500, 235500, 184900, 150600, 288400, 104100, 241800, 95500, 46600, 8600),
    "2023" = c(2509700, 1093000, 1416700, 791800, 2207500, 1093000, 1114500, 691200, 1766500, 839600, 926900, 540100, 441100, 253400, 187600, 151200, 302200, 100500, 251700, 91700, 50400, 8900)
  )
  colnames(df) <- c("family_type", "1985", "1995", "2005", "2015", "2020", "2023")
  return(df)
}

# Function to calculate percentages
calculate_percentages <- function(df, year) {
  total_married <- sum(df[df$family_type %in% c("Married couples without children in household", "Married couples"), as.character(year)])
  without_children <- df[df$family_type == "Married couples without children in household", as.character(year)]

  perc_without_children <- without_children / total_married * 100
  perc_with_children <- 100 - perc_without_children

  return(data.frame(Year = year,
                    WithChildren = perc_with_children,
                    WithoutChildren = perc_without_children))
}

# Function to create the plot
create_plot <- function(percentages, file_name) {
  df_long <- percentages %>%
    pivot_longer(cols = -Year, names_to = "FamilyType", values_to = "Percentage")

  plot <- ggplot(df_long, aes(x = factor(Year), y = Percentage, fill = FamilyType)) +
    geom_bar(stat = "identity") +
    labs(title = "Percentage of Married Couples With and Without Children",
         x = "Year", y = "Percentage", fill = "Family Type") +
    theme_minimal()

  ggsave(file_name, plot = plot, width = 7, height = 7)
}

# Function to generate the plot for a given year
generate_comparison_plot <- function(chosen_year) {
  if (!is.numeric(chosen_year)) {
    stop("Invalid input type. Input a number.")
  }

  # Get user input
  as.numeric(chosen_year)

  # Check if the year is valid
  valid_years <- c(1985, 1995, 2005, 2015, 2020, 2023)
  if (!(chosen_year %in% valid_years)) {
    stop("Invalid year! Please enter a valid year from the following list:
         1985, 1995, 2005, 2015, 2020, 2023.")
  }

  # Read and process data
  df <- read_and_process_data()

  # Determine the years to compare
  years_to_compare <- valid_years[valid_years <= chosen_year]
  percentages_list <- lapply(years_to_compare, calculate_percentages, df = df)
  percentages_combined <- do.call(rbind, percentages_list)

  # Create and save the plot
  create_plot(percentages_combined, "graph.png")

  cat("Graph saved as 'graph.png'.\n")
}
