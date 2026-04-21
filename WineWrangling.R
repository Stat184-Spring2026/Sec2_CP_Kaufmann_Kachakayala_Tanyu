library(tidyverse)
library(esquisse)
redWineData <- 
  read.csv(file = "~/Desktop/PSU/Sophomore Year Spring Semester/Stat 184/wine+quality (1)/winequality-red.csv",
           header = FALSE,
           sep = ";",
           skip = 1)
redWineProgress <- redWineData |>
  rename(
    "Fixed Acidity" = V1,
    "Volatile Acidity" = V2,
    "Citric Acid" = V3,
    "Residual Sugar" = V4,
    "Chlorides" = V5,
    "Free Sulfur Dioxide" = V6,
    "Total Sulfur Dioxide" = V7,
    "Density" = V8,
    "pH" = V9,
    "Sulphates" = V10,
    "Alcohol" = V10,
    "Quality" = V12
  ) |>
  mutate(
    color = "red"
  )

whiteWineData <- 
  read.csv(file = "~/Desktop/PSU/Sophomore Year Spring Semester/Stat 184/wine+quality (1)/winequality-white.csv",
           header = FALSE,
           sep = ";",
           skip = 1)

whiteWineProgress <- whiteWineData |>
  rename(
    "Fixed Acidity" = V1,
    "Volatile Acidity" = V2,
    "Citric Acid" = V3,
    "Residual Sugar" = V4,
    "Chlorides" = V5,
    "Free Sulfur Dioxide" = V6,
    "Total Sulfur Dioxide" = V7,
    "Density" = V8,
    "pH" = V9,
    "Sulphates" = V10,
    "Alcohol" = V10,
    "Quality" = V12
  ) |>
  mutate(
    color = "white"
  )
wineData <- bind_rows(redWineProgress, whiteWineProgress)
esquisse::esquisser(
  data = wineData
)
