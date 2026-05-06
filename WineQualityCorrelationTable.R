## Step 1: Load necessary packages----
library(tidyverse)
library(knitr)

set.seed(14)

redWineData <- read.csv(
  file = "~/Desktop/Stat184/Sec2_CP_Kaufmann_Kachakayala_Tanyu/winequality-red.csv",
  header = FALSE,
  sep = ";",
  skip = 1
)

whiteWineData <- read.csv(
  file = "~/Desktop/Stat184/Sec2_CP_Kaufmann_Kachakayala_Tanyu/winequality-white.csv",
  header = FALSE,
  sep = ";",
  skip = 1
)

column_names <- c(
  "Fixed.Acidity",
  "Volatile.Acidity",
  "Citric.Acid",
  "Residual.Sugar",
  "Chlorides",
  "Free.Sulfur.Dioxide",
  "Total.Sulfur.Dioxide",
  "Density",
  "pH",
  "Sulphates",
  "Alcohol",
  "Quality"
)

names(redWineData) <- column_names

names(whiteWineData) <- column_names

redWineProgress <- redWineData |>
  mutate(color = "red")

whiteWineProgress <- whiteWineData |>
  mutate(color = "white")

wineData <- bind_rows(redWineProgress, whiteWineProgress)

characteristics <- c(
  "Fixed.Acidity",
  "Volatile.Acidity",
  "Citric.Acid",
  "Residual.Sugar",
  "Chlorides",
  "Free.Sulfur.Dioxide",
  "Total.Sulfur.Dioxide",
  "Density",
  "pH",
  "Sulphates",
  "Alcohol"
)

get_r_values <- function(characteristic) {
  sampledData <- wineData |>
    filter(
      between(
        .data[[characteristic]],
        quantile(.data[[characteristic]], 0.25) - 1.5 * IQR(.data[[characteristic]]),
        quantile(.data[[characteristic]], 0.75) + 1.5 * IQR(.data[[characteristic]])
      )
    ) |>
    group_by(color) |>
    slice_sample(n = 1000) |>
    
    ungroup()
  sampledData |>
    group_by(color) |>
    summarize(
      r_value = cor(
        .data[[characteristic]],
        Quality,
        method = "pearson",
        use = "complete.obs"
      ),
      .groups = "drop"
    ) |>
    mutate(characteristic = characteristic) |>
    select(characteristic, color, r_value)
}
r_values_long <- map_dfr(characteristics, get_r_values)
r_values_table <- r_values_long |>
  pivot_wider(
    names_from = color,
    values_from = r_value,
    names_prefix = "r_"
  ) |>
  mutate(
    r_red = round(r_red, 3),
    r_white = round(r_white, 3)
  )
knitr::kable(
  r_values_table,
  col.names = c("Characteristic", "Red Wine r", "White Wine r")
)