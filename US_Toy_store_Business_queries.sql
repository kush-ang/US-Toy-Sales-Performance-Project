USE toy_store;

# TOTAL REVENUE AND PROFIT BY PRODUCT NAME AND PRODUCT CATEGORY

SELECT 
products.Product_Name,
products.Product_Category,
ROUND(SUM(sales.Units*products.Product_Price),2) AS Total_Revenue,
ROUND(SUM(sales.Units*(products.Product_Price - products.Product_Cost)),2) AS Total_Profit
FROM sales
INNER JOIN products
ON sales.Product_ID = products.Product_ID
GROUP BY products.Product_Name , products.Product_Category
ORDER BY Total_Revenue DESC;

# TOP 10 STORES BY REVENUE AND AVG UNIT SOLD

SELECT stores.Store_Name, stores.Store_City,
ROUND(SUM(sales.Units*products.Product_Price),2) AS Total_Revenue ,
ROUND(AVG(sales.Units),1) AS Average_Unit_Sold_per_Transaction
FROM sales
INNER JOIN stores
ON sales.Store_ID = stores.Store_ID
INNER JOIN products
ON sales.Product_ID = products.Product_ID
GROUP BY stores.Store_Name , stores.Store_City
ORDER BY Total_Revenue DESC 
LIMIT 10;

# MONTH TREND BY TOTAL REVENUE

# TOP MONTH - MARCH
SELECT 
MONTHNAME(sales.Date) AS Month_Name,
ROUND(SUM(sales.Units*products.Product_Price),2) AS Total_Revenue
FROM sales
INNER JOIN products
ON sales.Product_ID = products.Product_ID
GROUP BY Month_Name
ORDER BY Total_Revenue DESC
LIMIT 1;

# LOWEST MONTH - FEBRUARY
SELECT 
MONTHNAME(sales.Date) AS Month_Name,
ROUND(SUM(sales.Units*products.Product_Price),2) AS Total_Revenue
FROM sales
INNER JOIN products
ON sales.Product_ID = products.Product_ID
GROUP BY Month_Name
ORDER BY Total_Revenue 
LIMIT 1;

# INVENTORY ANALYSIS

SELECT 
products.Product_Name,
inventory.Stock_On_Hand,
SUM(sales.Units) AS Total_Units_Sold
FROM sales
INNER JOIN inventory
ON inventory.Product_ID = sales.Product_ID
INNER JOIN products
ON products.Product_ID = sales.Product_ID
WHERE inventory.Stock_On_Hand < 10 
GROUP BY products.Product_Name,inventory.Stock_On_Hand
ORDER BY Total_Units_Sold DESC;

# CUSTOMER BUYING BEHAVIOUR (PRICE VS UNIT SOLD)
SELECT 
products.Product_Name,
products.Product_Price,
SUM(sales.Units) AS Total_Units_Sold
FROM sales
INNER JOIN products
ON products.Product_ID = sales.Product_ID
GROUP BY products.Product_Name,
products.Product_Price
ORDER BY products.Product_Price DESC;









