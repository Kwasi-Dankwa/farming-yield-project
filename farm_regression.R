# Load libraries
library(tidyverse)
library(car)


# loading and previewing dataset
df <- read.csv("Smart_Farming_Crop_Yield_2024.csv")
head(df)

# summary of the data
summary(df)

# initial model
model <- lm(yield_kg_per_hectare ~ temperature_C + NDVI_index + humidity_. + rainfall_mm + soil_moisture_. + irrigation_type + fertilizer_type, data = df)
summary(model)
vif(model)

## second model with interaction terms
model2 <- lm(yield_kg_per_hectare ~ temperature_C * humidity_. + NDVI_index * soil_moisture_. + rainfall_mm, data = df)
summary(model2)

## stepwise regression to find the best model
step(model, direction = "both")



