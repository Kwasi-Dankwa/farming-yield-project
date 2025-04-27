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








