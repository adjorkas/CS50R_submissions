df <- data.frame(
  food = c("humita", "pastelitos", "locro", "tostado de miga de J&Q"),
  vegetarian = c("Yes", "Yes", "No", "No"),
  temperature = c("Hot", "Cold", "Hot", "Cold")
)

temperature <- readline("Would you like a hot or cold dish? (Hot/Cold): ")
vegetarian <- readline("Would you like a vegetarian dish? (Yes/No): ")
valid <- TRUE

if (!(temperature %in% c("Hot", "Cold"))) {
  print("Write a valid temperature input!")
  valid <- FALSE
}
if(!vegetarian %in% c("Yes", "No")) {
  print("Write a valid vegetarian input!")
  valid <- FALSE
}
if (valid) {
  selection <- df[df$temperature == temperature & df$vegetarian == vegetarian, ]$food
  print(paste0("🧉 I recommend ", selection, "! 🧉"))
}
