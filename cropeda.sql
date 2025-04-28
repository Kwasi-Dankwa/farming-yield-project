--EDA--

-- viewing first 10 values of dataset -- 
SELECT * 
FROM Smart_Farming_Crop_Yield_2024
LIMIT 10;

-- number of rows --
SELECT COUNT(*) 
FROM Smart_Farming_Crop_Yield_2024;

-- what are the top performing crops --
SELECT crop_type, round(avg(yield_kg_per_hectare), 2) as total_yield_kg_hectare
from Smart_Farming_Crop_Yield_2024
group by crop_type
order by total_yield_kg_hectare desc;

-- which region produces the highest yield -- 
SELECT region, round(AVG(yield_kg_per_hectare), 2) as total_yield_kg_hectare
FROM Smart_Farming_Crop_Yield_2024 
GROUP BY region 
ORDER BY AVG(yield_kg_per_hectare) DESC;

-- i tried to find a correlation between pesticide use and yield but--
-- a program like r will be suitable for more exploration--
SELECT pesticide_usage_ml, AVG(yield_kg_per_hectare) 
FROM Smart_Farming_Crop_Yield_2024 
GROUP BY pesticide_usage_ml 
ORDER BY pesticide_usage_ml;

--  identifying the most frequent crop disease status for each region -- 
WITH disease_counts AS (
    SELECT region, crop_disease_status, COUNT(*) AS disease_count
    FROM Smart_Farming_Crop_Yield_2024
    GROUP BY region, crop_disease_status
)
SELECT dc1.region, dc1.crop_disease_status, dc1.disease_count
FROM disease_counts dc1
INNER JOIN (
    SELECT region, MAX(disease_count) AS max_count
    FROM disease_counts
    GROUP BY region
) dc2
ON dc1.region = dc2.region AND dc1.disease_count = dc2.max_count
ORDER BY dc1.region;

-- show disease status for each crop --
select crop_type, crop_disease_status, count(*) as disease_count
from Smart_Farming_Crop_Yield_2024
group by crop_type, crop_disease_status;

-- show most frequent disease status for each crop -- 
WITH disease_counts AS (
    SELECT crop_type, crop_disease_status, COUNT(*) AS disease_count
    FROM Smart_Farming_Crop_Yield_2024
    GROUP BY crop_type, crop_disease_status
)
SELECT dc1.crop_type, dc1.crop_disease_status, dc1.disease_count
FROM disease_counts dc1
INNER JOIN (
    SELECT crop_type, MAX(disease_count) AS most_frequent_disease
    FROM disease_counts
    GROUP BY crop_type
) dc2
ON dc1.crop_type = dc2.crop_type AND dc1.disease_count = dc2.most_frequent_disease
ORDER BY dc1.crop_type;

-- maize was the healthiest crop across all smart farms--
--cotton, soybean, and wheat has the most severe afflicted crops--








