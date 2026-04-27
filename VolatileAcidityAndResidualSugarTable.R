### Creating a Table of Descriptive Statistics that Contrasts Red and White Wine
## Step 1: Load necessary packages----
library(tidyverse)
library(knitr)
library(kableExtra)
library(janitor)
## Step 2: Load the data----
redWineData <- 
  read.csv(file = "~/Desktop/PSU/Sophomore Year Spring Semester/Stat 184/wine+quality (1)/winequality-red.csv",
           header = FALSE,
           sep = ";",
           skip = 1) # Omit the first row of column titles when importing data
whiteWineData <- 
  read.csv(file = "~/Desktop/PSU/Sophomore Year Spring Semester/Stat 184/wine+quality (1)/winequality-white.csv",
           header = FALSE,
           sep = ";",
           skip = 1) # Omit the first row of column titles when importing data
## Step 3: Tidy the data for each type of wine----
redWineProgress <- redWineData |>
  rename( # Add descriptive column names
    "Fixed.Acidity" = V1,
    "Volatile.Acidity" = V2,
    "Citric.Acid" = V3,
    "Residual.Sugar" = V4,
    "Chlorides" = V5,
    "Free.Sulfur.Dioxide" = V6,
    "Total.Sulfur.Dioxide" = V7,
    "Density" = V8,
    "pH" = V9,
    "Sulphates" = V10,
    "Alcohol" = V11,
    "Quality" = V12
  ) |>
  mutate( # Create a column to label each sample as red wine
    color = "red" 
  )

whiteWineProgress <- whiteWineData |>
  rename(
    "Fixed.Acidity" = V1,
    "Volatile.Acidity" = V2,
    "Citric.Acid" = V3,
    "Residual.Sugar" = V4,
    "Chlorides" = V5,
    "Free.Sulfur.Dioxide" = V6,
    "Total.Sulfur.Dioxide" = V7,
    "Density" = V8,
    "pH" = V9,
    "Sulphates" = V10,
    "Alcohol" = V11,
    "Quality" = V12
  ) |>
  mutate( # Create a column to label each sample as white wine
    color = "white"
  )

## Step 4: Bind the dataframes for red and white wine----
wineData <- bind_rows(redWineProgress, whiteWineProgress)


wineSummary <- wineData |>
  group_by(color) |> # all subsequent operations will be performed for each color
  summarise(
    minVolatileAcidity = min(Volatile.Acidity, na.rm = TRUE), # Compute minimum volatile acidity concentration
    maxVolatileAcidity = max(Volatile.Acidity, na.rm = TRUE), # Compute maximum volatile acidity concentration
    avgVolatileAcidity = mean(Volatile.Acidity, na.rm = TRUE), # Compute average volatile acidity concentration
    medianVolatileAcidity = median(Volatile.Acidity, na.rm = TRUE), # Compute median volatile acidity concentration
    stdevVolatileAcidity = sd(Volatile.Acidity, na.rm = TRUE), # Compute st dev for volatile acidity concentration
    minResidualSugar = min(Residual.Sugar, na.rm = TRUE), # Compute minimum residual sugar concentration
    maxResidualSugar = max(Residual.Sugar, na.rm = TRUE), # Compute maximum residual sugar concentration
    avgResidualSugar = mean(Residual.Sugar, na.rm = TRUE), # Compute average residual sugar concentration
    medianResidualSugar = median(Residual.Sugar, na.rm = TRUE), # Compute median residual sugar concentration
    stdevResidualSugar = sd(Residual.Sugar, na.rm = TRUE), # Compute st dev for residual sugar concentration
  )
wineSummary |>
  knitr::kable(
    caption = 'Descriptive Statistics for Volatile Acidity and Residual Sugar Concentrations for Red and White Wine',
    digits = 2, # Truncate values to two decimal places
    align = 'lcccccccccc', # Align the text
    col.names = c('Color', 'Min Volatile Acidity (g(acetic acid)/L)', 
                  'Max Volatile Acidity (g(acetic acid)/L)', 
                  'Average Volatile Acidity (g(acetic acid)/L)', 
                  'Median Volatile Acidity (g(acetic acid)/L)', 
                  'St Dev Volatile Acidity (g(acetic acid)/L)',
                  'Min Residual Sugar (g/L)', 'Max Residual Sugar (g/L)', 
                  'Average Residual Sugar (g/L)', 'Median Residual Sugar (g/L)', 
                  'St Dev Residual Sugar (g/L)') # Add descriptive column names
  ) |>
  kable_classic(
    lightable_options = 'striped' # Add light stripes to make the table more visually appealling
  ) |>
  footnote( # Add a footnote describing the data source
    general = 'Data sourced from Cortez et al., 2009',
    footnote_as_chunk = TRUE # Fit the format on one line
  )
