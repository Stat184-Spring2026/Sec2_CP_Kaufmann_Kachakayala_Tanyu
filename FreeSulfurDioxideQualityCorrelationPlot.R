### Creating a Scatterplot Showing the Correlation Between Free Sulfur Dioxide and Quality
## Step 1: Load necessary packages----
library(tidyverse)
library(ggpubr)
set.seed(14)
## Step 2: Load the data----
redWineData <- 
  read.csv(file = "~/Desktop/Stat184/Sec2_CP_Kaufmann_Kachakayala_Tanyu/winequality-red.csv",
           header = FALSE,
           sep = ";",
           skip = 1) # Omit the first row of column titles when importing data
whiteWineData <- 
  read.csv(file = "~/Desktop/Stat184/Sec2_CP_Kaufmann_Kachakayala_Tanyu/winequality-white.csv",
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
wineData <- bind_rows(redWineProgress, whiteWineProgress) |> # Join the dataframes
  group_by(color) |> # Perform all subsequent operations for each color
  slice_sample(n = 100) # Take a random sample of 100 wine samples of each color

## Step 5: Create an informative plot----
FreeSulfurDioxideQualityPlot <- wineData |>
  ggplot(
    mapping = aes(
      x = Free.Sulfur.Dioxide,
      y = Quality,
      color = color)
  ) + 
  geom_jitter() +
  geom_smooth(method = "lm", se = FALSE) + # Add a linear trendline
  stat_cor(method = "pearson") + # Add Pearson's correlation coefficient for each color
  scale_color_hue(direction = 1) +
  labs( # Add descriptive titles and an informative subtitle and caption
    title = "Correlation Between Free Sulfur Dioxide Concentration and Quality of Wine",
    subtitle = "Random sample of 200 wine samples with 100 of each color",
    x = expression("Free Sulfur Dioxide Concentration (mg/dm"^3*")"),
    y = "Quality",
    caption = "Data source: Cortez et al., 2009"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom") # Position the legend below the graph

FreeSulfurDioxideQualityPlot
