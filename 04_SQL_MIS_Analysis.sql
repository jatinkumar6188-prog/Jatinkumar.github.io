-- Jatin Kumar | MIS SQL Analysis Project
-- Sample table: sales_data
CREATE TABLE sales_data (
    sale_date DATE,
    region VARCHAR(20),
    product VARCHAR(50),
    salesperson VARCHAR(50),
    units INT,
    net_sales DECIMAL(12,2),
    target DECIMAL(12,2)
);

-- 1. Total sales
SELECT SUM(net_sales) AS total_sales
FROM sales_data;

-- 2. Region-wise sales
SELECT region, SUM(net_sales) AS sales
FROM sales_data
GROUP BY region
ORDER BY sales DESC;

-- 3. Product-wise performance
SELECT product, SUM(units) AS units_sold,
       SUM(net_sales) AS sales
FROM sales_data
GROUP BY product
ORDER BY sales DESC;

-- 4. Target achievement
SELECT region,
       SUM(net_sales) AS sales,
       SUM(target) AS target,
       ROUND(SUM(net_sales)*100.0/SUM(target),2) AS achievement_pct
FROM sales_data
GROUP BY region
ORDER BY achievement_pct DESC;

-- 5. Monthly trend
SELECT DATE_TRUNC('month', sale_date) AS month,
       SUM(net_sales) AS sales
FROM sales_data
GROUP BY DATE_TRUNC('month', sale_date)
ORDER BY month;
