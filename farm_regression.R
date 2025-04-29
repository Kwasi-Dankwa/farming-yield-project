# Load libraries
library(tidyverse)
library(car)
library(dplyr)


# loading and previewing dataset
df <- read.csv("Smart_Farming_Crop_Yield_2024.csv")
head(df)

# filtering unecessary rows for linear regression
df_filtered <- df %>%
  select(-farm_id, -sowing_date, -harvest_date, -total_days, -sensor_id, -timestamp, -latitude, -longitude)


# summary of the data
summary(df)

# initial model
model <- lm(yield_kg_per_hectare ~ temperature_C + NDVI_index + humidity_. + rainfall_mm + soil_moisture_. + irrigation_type + fertilizer_type, data = df)
summary(model)

## second model with interaction terms
model2 <- lm(yield_kg_per_hectare ~ temperature_C * humidity_. + NDVI_index * soil_moisture_. + rainfall_mm, data = df)
summary(model2)

## stepwise regression to find the best model
step(model, direction = "both")

## include all variables from filtered df in model 3
model3 <- lm(yield_kg_per_hectare ~ ., data = df_filtered)
summary(model3)

## stepwise regression for model 3
step(model3, direction = "both")

## transformed model
model4 <- lm(yield_kg_per_hectare ~ rainfall_mm + I(rainfall_mm^2), data = df_filtered)
summary(model4)

## plot diagnostics to view linearity assumptions
plot(model4)



