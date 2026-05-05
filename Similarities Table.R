### Creating a Table of Descriptive Statistics that Contrasts Red and White Wine
## Step 1: Load necessary packages----
library(tidyverse)
library(knitr)
library(kableExtra)
library(janitor)
## Step 2: Load the data----
redWineData <- 
  read.csv(file = "~/Desktop/wine+quality/winequality-red.csv",
           header = FALSE,
           sep = ";",
           skip = 1) # Omit the first row of column titles when importing data
whiteWineData <- 
  read.csv(file = "~/Desktop/wine+quality/winequality-white.csv",
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
  group_by(color) |> 
  summarise(
    minPH = min(pH, na.rm = TRUE),
    maxPH = max(pH, na.rm = TRUE),
    avgPH = mean(pH, na.rm = TRUE),
    medianPH = median(pH, na.rm = TRUE),
    stdevPH = sd(pH, na.rm = TRUE),
    
    minAlcohol = min(Alcohol, na.rm = TRUE),
    maxAlcohol = max(Alcohol, na.rm = TRUE),
    avgAlcohol = mean(Alcohol, na.rm = TRUE),
    medianAlcohol = median(Alcohol, na.rm = TRUE),
    stdevAlcohol = sd(Alcohol, na.rm = TRUE)
  )
#AUTHOR JOSHUA 
longWineStats <- wineSummary |>
  rename(
    'Color' = color,
    'Min pH' = minPH,
    'Max pH' = maxPH,
    'Average pH' = avgPH,
    'Median pH' = medianPH,
    'St Dev pH' = stdevPH,
    'Min Alcohol (%)' = minAlcohol,
    'Max Alcohol (%)' = maxAlcohol,
    'Average Alcohol (%)' = avgAlcohol,
    'Median Alcohol (%)' = medianAlcohol,
    'St Dev Alcohol (%)' = stdevAlcohol
  ) |>
  select(-Color) |> # Remove the column containing the wine's color
  round(3) |> # Only show three digits for each value
  t() |> # Switch the rows and columns of the dataframe 
  as.data.frame() |>
  knitr::kable(
    caption = 'Descriptive Statistics for pH and Alcohol Concentrations for Red and White Wine',
    align = 'lcc', # Align the text
    col.names = c('', 'Red Wine', 'White Wine')
  ) |>
  kable_classic(
    lightable_options = 'striped' # Add light stripes to make the table more visually appealling
  ) |>
  footnote( # Add a footnote describing the data source
    general = 'Data sourced from Cortez et al., 2009',
    footnote_as_chunk = TRUE # Fit the format on one line
  )
longWineStats

similarVisualData <- wineData |>
  select(color, pH, Alcohol) |>
  pivot_longer(
    cols = c(pH, Alcohol),
    names_to = "Characteristic",
    values_to = "Value"
  ) |>
  group_by(color, Characteristic) |>
  summarise(
    Average = mean(Value, na.rm = TRUE),
    .groups = "drop"
  )

# Plot showing similar values
ggplot(similarVisualData, aes(x = color, y = Average, fill = color)) +
  geom_col() +
  facet_wrap(~ Characteristic, scales = "free_y") +
  labs(
    title = "Average Value between two characteristics showing similarities",
    x = "Wine Type",
    y = "Average Value",
    fill = "Wine Type"
  ) +
  theme_minimal()