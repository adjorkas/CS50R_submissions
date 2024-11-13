df <- data.frame(
  tea = c("green", "black", "chamomile", "rooibos"),
  caffeine = c("Yes", "Yes", "No", "No"),
  flavor = c("Light", "Bold", "Light", "Bold")
  )

flavor <- readline("Would you like a bold or light tea flavor? (Bold/Light): ")
caffeine <- readline("Would you like caffeine in your tea? (Yes/No): ")
valid <- TRUE

if (!(flavor %in% c("Bold", "Light"))) {
  print("Write a valid flavor input!")
  valid <- FALSE
}
if(!caffeine %in% c("Yes", "No")) {
  print("Write a valid caffeine input!")
  valid <- FALSE
}
if (valid) {
  selection <- df[df$caffeine == caffeine & df$flavor == flavor, ]$tea
  print(paste0("🫖 I recommend ", selection, " tea. ☕︎"))
}
