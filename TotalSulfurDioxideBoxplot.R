### Creating a Boxplot of Total Sulfur Dioxide Concentration by Wine Color
## Step 1: Load necessary packages----
library(tidyverse)
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
    "Citric Acid" = V3,
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

## Step 5: Create the boxplot
sulfurDioxidePlot <- ggplot(
  data = wineData,
  mapping = aes(
    x = color, # Assign color to the x-axis
    y = Total.Sulfur.Dioxide, # Assign total sulfur dioxide to the y-axis
    color = color)
) +
  geom_boxplot(aes(fill = color), notch = TRUE, outlier.alpha = 0.5, color = "#000000") +
  # Fill each box based on the wine's color
  # Add in notches to easily compare the medians of each box
  # Make the outliers more transparent so that none of them are masked
  labs(
    title = "Sulfur Dioxide Concentration Based on Wine Color", # Add descriptive plot and axis titles
    x = "Wine Color",
    y = "Total Sulfur Dioxide (mg/dm^3)",
    subtitle = "Concentrations Measured by the iLab Software", # Provide context in the subtitle
    caption = "Source: Cortez et al., 2009" # Cite the data source in the caption
  ) +
  theme_bw() +
  theme(legend.position = "bottom") # Place the legend below the figure
sulfurDioxidePlot
