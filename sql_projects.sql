-- Create databases e-commerce sales analysis
CREATE DATABASE E_commerce_Sales;

-- Use database 
USE E_commerce_Sales;

-- Show tables customers,products,orders
SELECT *FROM customers;
SELECT *FROM products;
SELECT *FROM orders;

-- Check data
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM Orders;

-- calculate Total sales Revenue
SELECT SUM(p.price * o.quantity) AS total_revenue
FROM Orders o
JOIN Products p ON o.product_id = p.product_id;

-- Find top customers by spending
SELECT c.name, SUM(p.price * o.quantity) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Products p ON o.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 5;

-- Most sold products
SELECT p.product_name, SUM(o.quantity) AS total_sold
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 5;

-- Revenue by category
SELECT p.category, SUM(p.price * o.quantity) AS revenue
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.category;

-- Revenue by city
SELECT c.city, SUM(p.price * o.quantity) AS revenue
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Products p ON o.product_id = p.product_id
GROUP BY c.city;

-- Monthly order trend
SELECT MONTH(order_date) AS month, COUNT(*) AS total_orders
FROM Orders
GROUP BY MONTH(order_date)
ORDER BY month;

-- Create reusable report
CREATE VIEW Sales_Report AS
SELECT 
    c.name,
    c.city,
    p.product_name,
    p.category,
    o.quantity,
    (p.price * o.quantity) AS revenue
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Products p ON o.product_id = p.product_id;

SELECT *FROM Sales_Report










