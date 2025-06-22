-- All table
select * 
from pizza_sales

-- 1. Total Revenue
select 
sum(total_price) as Total_Revenue
from pizza_sales

-- 2. Avarage Order Value
select sum(total_price) / count(DISTINCT order_id) as Avg_Order_Value
from pizza_sales

-- 3. Total Pizzas Sold
select
sum(quantity) as Total_Pizza_Sold
from pizza_sales

-- 4. Total Orders
select
count(DISTINCT order_id) as Total_Orders
from pizza_sales

-- 5. Avarage Pizza Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales

-- CHARTS REQUIREMENT --

-- 1. Daily Trend for Total Orders
select
DATENAME(DW, order_date) as order_day,
COUNT(DISTINCT order_id) as Total_orders
from pizza_sales
group by DATENAME(DW, order_date)

-- 2. Monthly Trend for Total Orders
SELECT 
DATENAME(MONTH, order_date) AS Month_Name,
COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_Orders DESC

-- 3. Percentage of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

-- 4. Percentage of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

-- 5. Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

-- 6. Top 5 Pizzas by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

-- 7. Bottom 5 Pizzas by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

-- 8. Top 5 Pizzas by Quantity
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

-- 9. Bottom 5 Pizzas by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC

-- 10. Top 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

-- 11. Bottom 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
