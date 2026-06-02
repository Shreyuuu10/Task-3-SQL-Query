CREATE DATABASE ecommerce_sales_analysis;

USE ecommerce_sales_analysis;

CREATE TABLE ecommerce_orders (
    OrderID VARCHAR(20),
    Product VARCHAR(100),
    Category VARCHAR(50),
    Brand VARCHAR(50),
    Platform VARCHAR(50),
    City VARCHAR(50),
    Price DECIMAL(10,2),
    Quantity INT,
    TotalAmount DECIMAL(12,2),
    Rating DECIMAL(3,2),
    Reviews INT,
    OrderDate DATE
);
SELECT * FROM ecommerce_data;

SELECT COUNT(*) AS Total_Orders
FROM ecommerce_data;

SELECT *
FROM ecommerce_data
WHERE Category='Electronics';

SELECT TOP 10 *
FROM ecommerce_data
ORDER BY TotalAmount DESC;

SELECT
Category,
SUM(TotalAmount) AS Revenue
FROM ecommerce_data
GROUP BY Category
ORDER BY Revenue DESC;

SELECT
Platform,
SUM(TotalAmount) AS Revenue
FROM ecommerce_data
GROUP BY Platform
ORDER BY Revenue DESC;

SELECT
City,
SUM(TotalAmount) AS Revenue
FROM ecommerce_data
GROUP BY City
ORDER BY Revenue DESC;

SELECT
Product,
AVG(Rating) AS Average_Rating
FROM ecommerce_data
GROUP BY Product
ORDER BY Average_Rating DESC;

SELECT
SUM(TotalAmount) AS Total_Revenue,
AVG(TotalAmount) AS Average_Order_Value,
MAX(TotalAmount) AS Highest_Order,
MIN(TotalAmount) AS Lowest_Order
FROM ecommerce_data;

SELECT *
FROM ecommerce_data
WHERE TotalAmount >
(
SELECT AVG(TotalAmount)
FROM ecommerce_data
);

GO

CREATE VIEW vw_category_sales AS
SELECT
Category,
SUM(TotalAmount) AS Revenue
FROM ecommerce_data
GROUP BY Category;

GO
SELECT * FROM vw_category_sales;

CREATE INDEX idx_category
ON ecommerce_orders(Category);

CREATE INDEX idx_platform
ON ecommerce_orders(Platform);

CREATE INDEX idx_city
ON ecommerce_orders(City);