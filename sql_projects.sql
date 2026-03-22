-- Create databases for e-commerce sales analysis
CREATE DATABASE E_commerce_Sales;

-- Use database 
USE E_commerce_Sales;

-- Show tables customers, products, orders
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

total_revenue
241470647

-- Find top customers by spending
SELECT c.name, SUM(p.price * o.quantity) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Products p ON o.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 5;

Name   Total_spent
Suman Jain	3354035
Suresh Sharma	3269921
Vikas Verma	3083110
Rohit Sharma	3051428
Pooja Kumar	2754412

-- Most sold products
SELECT p.product_name, SUM(o.quantity) AS total_sold
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 5;

Product_name, total_sold
Laptop	376
Dress	372
Cricket Bat	345
Wardrobe	337
Sofa	333

-- Revenue by category
SELECT p.category, SUM(p.price * o.quantity) AS revenue
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.category;

Category Revenue
Home	62473565
Sports	59715374
Electronics	59976181
Clothing	59305527

-- Revenue by city
SELECT c.city, SUM(p.price * o.quantity) AS revenue
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Products p ON o.product_id = p.product_id
GROUP BY c.city;

City   Revenue
Delhi	41988501
Bangalore	43301597
Mumbai	39784800
Meerut	38141139
Kolkata	36727627
Chennai	41526983

-- Monthly order trend
SELECT MONTH(order_date) AS month, COUNT(*) AS total_orders
FROM Orders
GROUP BY MONTH(order_date)
ORDER BY month;
2000

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










