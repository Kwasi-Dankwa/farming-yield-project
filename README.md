# 🌾 Crop Yield Prediction & Data Exploration Project

This project analyzes crop yield data using **SQL**, **Python (scikit-learn)**, and **Tableau**, combining data exploration and machine learning to understand and predict agricultural productivity. 

## 📊 Project Overview

- **Goal:** Predict crop yield (`yield_kg_per_hectare`) and explore underlying patterns in agricultural data.
- **Data:** 500-row dataset containing features like soil type, rainfall, and crop varieties.
- > 📁 [`Smart_Farming_Crop_Yield_2024.csv`](https://www.kaggle.com/datasets/atharvasoundankar/smart-farming-sensor-data-for-yield-prediction)
- **Tools Used:**  
  - 🐍 Python and R (for modeling and data cleaning)
  - 🧮 SQL (for early data exploration)
  - 📈 Tableau (for visual dashboards)
  - 📦 scikit-learn (for regression models)
 
## EDA PHASE

### 🗃 SQL Queries:
EDA was conducted using SQL to uncover:
- Top performing crops, regions with highest yield, most frequent crop disease for each crop
- Crop yield grouped by region and season
> 📁 [`cropeda.sql`](https://github.com/Kwasi-Dankwa/farming-yield-project/blob/main/cropeda.sql)

### R and Python
EDA using R and Python:
- Filtering unecessary columns for linear regression such as farm_id and sensor_id
- Building multiple linear regression models to find out how various predictors explain yield_kg_hectare
- Stepwise model which concluded the best model was yield_kg_hectare explained by rainfall but it still had a low R^2 value
- Null values and data completeness
> 📁 [`farm_regression.R`](https://github.com/Kwasi-Dankwa/farming-yield-project/blob/main/farm_regression.R)
> 📁 [`Smart_Farm.ipynb`](https://github.com/Kwasi-Dankwa/farming-yield-project/blob/main/Smart_Farm.ipynb)


### 📊 Analysis
#### 1. 🌾 Disease Distribution by Crop

![Disease Distribution by Crop](images/distru.png "Disease Distribution by Crop")

##### Takeaways
* Soybean and Cotton face the most Severe disease instances.
* Maize and Wheat appear to be the most resilient, with higher proportions of healthy (None) or mild cases.
* This graph can help prioritize crop-specific disease intervention efforts.


#### 2. ❄️ Is Temperature Related to Disease Outbreaks?

![DTemperature](images/temperature.png "temperature")

>  This graph shows that in this particular dataset, there is little to no apparent relationship between the average temperature and the severity of crop disease outbreaks. The average temperature remains relatively constant (around 24.5°C) regardless of whether the crops have mild, moderate, severe, or no disease. Therefore, Temperature does not affect disease type

#### 3.🌿 Average Yield by Crop and Region

![AverageCrop](images/avgcrop.png "averagecrop")

> This heatmap compares the average yields of different crops across various geographical regions. It allows for quick identification of which crops perform best in which regions based on yield per hectare. For example, we can easily see that South India has a particularly high average yield for both Rice and Soybean compared to the other regions shown.

##### Takeaways
* Cotton: Appears to have a relatively moderate yield in all the represented regions.
* Maize: Shows a higher average yield in Central USA and South USA (darker teal) compared to East Africa and North India (lighter teal). South India seems to have a moderate yield.
* Rice: Exhibits a higher average yield in South India (darkest teal) compared to the other regions, which show relatively lower to moderate yields.
* Soybean: Displays a high average yield in South India (darkest teal) and Central USA (darker teal), with moderate yields in South USA and North India, and a lower yield in East Africa (lighter teal).
* Wheat: Shows a moderate to high average yield in Central USA and South USA, a moderate yield in North India, and lower yields in East Africa and South India (lighter teal).

#### 4. 📊 Pesticide Use vs Yield

![Pest Use](images/pestuse.png "pestuse")

> Looking at all the points, there appears to be a generally positive correlation between pesticide usage and yield. As pesticide usage increases, the yield tends to increase as well. This is suggested by the upward sloping trend of most of the individual disease status lines.

##### Takeways
* The red trend line (None - no disease) starts at a lower yield with lower pesticide use but shows a steep positive slope. This suggests that for crops with no disease, increased pesticide use is strongly associated with higher yields.
* The blue (Mild disease) and orange (Moderate disease) trend lines start at higher yield levels compared to the "None" category at lower pesticide usage. They also show a positive relationship, though the slopes might differ slightly. This could imply that even with some disease, a certain level of yield is maintained, and increasing pesticides further boosts it.
* The teal trend line (Severe disease) starts at the highest yield level at lower pesticide usage among all categories. However, its slope seems less steep than the "None" category.
> This might suggest that even with increasing pesticide use, the yield gains for severely diseased crops are not as dramatic as for healthy crops. It's also worth noting that there are fewer data points in the higher pesticide usage range for the severely diseased category. In summary, this graph suggests that, in general, higher pesticide usage is associated with higher yields across all crop disease statuses. However, the relationship might differ depending on the severity of the disease. Notably, healthy crops (no disease) seem to benefit significantly from increased pesticide application in terms of yield gain, while severely diseased crops might show a less pronounced increase in yield with higher pesticide use.






# REGRESSION MODEL DISCUSSION

Regression models trained to predict crop yield:
- Linear Regression
- Ridge & Lasso
- Random Forest
- Gradient Boosting
- K-Nearest Neighbors
- Decision Tree

### ⚙️ Model Performance

| Regression Model     | R² Score  | MSE           |
|----------------------|-----------|----------------|
| Linear Regression     | -0.0556   | 1,457,785.46   |
| Ridge Regression      | -0.0546   | 1,456,519.12   |
| Lasso Regression      | -0.0541   | 1,455,756.44   |
| Random Forest         | -0.0486   | 1,448,144.37   |
| Gradient Boosting     | -0.1266   | 1,555,865.67   |
| K-Nearest Neighbors   | -0.1693   | 1,614,884.98   |
| Decision Tree         | -1.5211   | 3,481,810.04   |

### Model Performance Graph
![Model Performance](images/modelperformance.png "Model Performance")



> 📉 Negative R² scores suggest that the models are underperforming relative to a simple mean-based prediction. Additionally, The small size of the dataset (500 rows) is likely contributing to the underperformance of the models. This is evident from the plot as ML models, especially more complex ones like Random Forests and Gradient Boosting, tend to perform poorly when trained on small datasets because they struggle to generalize properly without enough data. The small dataset also show it’s hard for the model to capture the full variability of the data, leading to biased predictions.



### 📉 Tableau Visualizations:
Tableau dashboards were used to:
- Visualize crop yields by region
- Analyze rainfall and fertilizer usage correlations
> 📊 [View the Tableau Dashboard](https://public.tableau.com/views/SmartFarmingYieldDashboard2024/Dashboard1?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)


