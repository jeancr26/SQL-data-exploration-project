/*
================================================================================
03_AGGREGATIONS.SQL

Purpose:
Practice aggregate functions:
COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING.

================================================================================
*/


-- ============================================================
-- 1. Calculate the total number of products.
-- ============================================================

SELECT
    COUNT(*) AS total_products
FROM products;



-- ============================================================
-- 2. Calculate the total number of manufacturers.
-- ============================================================

SELECT
    COUNT(*) AS total_manufacturers
FROM manufacturers;



-- ============================================================
-- 3. Calculate the number of different manufacturers in products.
-- ============================================================

SELECT
    COUNT(DISTINCT manufacturer_id) AS different_manufacturers
FROM products;



-- ============================================================
-- 4. Calculate the average product price.
-- ============================================================

SELECT
    AVG(price) AS average_price
FROM products;



-- ============================================================
-- 5. Calculate the cheapest product price.
-- ============================================================

SELECT
    MIN(price) AS minimum_price
FROM products;



-- ============================================================
-- 6. Calculate the highest product price.
-- ============================================================

SELECT
    MAX(price) AS maximum_price
FROM products;



-- ============================================================
-- 7. Calculate the total value of all product prices.
-- ============================================================

SELECT
    SUM(price) AS total_price
FROM products;



-- ============================================================
-- 8. Calculate the number of products from Asus.
-- ============================================================

SELECT
    m.manufacturer_name,
    COUNT(p.product_id) AS total_products
FROM manufacturers m
LEFT JOIN products p
ON m.manufacturer_id = p.manufacturer_id
WHERE m.manufacturer_name = 'Asus'
GROUP BY m.manufacturer_name;



-- ============================================================
-- 9. Display maximum, minimum, average price and total products
-- from Crucial.
-- ============================================================

SELECT
    MAX(p.price) AS highest_price,
    MIN(p.price) AS lowest_price,
    AVG(p.price) AS average_price,
    COUNT(p.product_id) AS total_products
FROM products p
INNER JOIN manufacturers m
ON p.manufacturer_id = m.manufacturer_id
WHERE m.manufacturer_name = 'Crucial';



-- ============================================================
-- 10. Count products per manufacturer including manufacturers
-- without products.
-- ============================================================

SELECT
    m.manufacturer_name,
    COUNT(p.product_id) AS total_products
FROM manufacturers m
LEFT JOIN products p
ON m.manufacturer_id = p.manufacturer_id
GROUP BY m.manufacturer_name
ORDER BY total_products DESC;



-- ============================================================
-- 11. Display maximum, minimum and average price per manufacturer.
-- ============================================================

SELECT
    m.manufacturer_name,
    MAX(p.price) AS highest_price,
    MIN(p.price) AS lowest_price,
    AVG(p.price) AS average_price
FROM manufacturers m
LEFT JOIN products p
ON m.manufacturer_id = p.manufacturer_id
GROUP BY m.manufacturer_name;



-- ============================================================
-- 12. Display manufacturers with average product price greater than $200.
-- ============================================================

SELECT
    m.manufacturer_id,
    AVG(p.price) AS average_price,
    COUNT(p.product_id) AS total_products
FROM manufacturers m
LEFT JOIN products p
ON m.manufacturer_id = p.manufacturer_id
GROUP BY m.manufacturer_id
HAVING AVG(p.price) > 200;



-- ============================================================
-- 13. Display manufacturer names with average price greater than $200.
-- ============================================================

SELECT
    m.manufacturer_name,
    AVG(p.price) AS average_price,
    COUNT(p.product_id) AS total_products
FROM manufacturers m
LEFT JOIN products p
ON m.manufacturer_id = p.manufacturer_id
GROUP BY m.manufacturer_name
HAVING AVG(p.price) > 200;



-- ============================================================
-- 14. Count products with price greater than or equal to $180.
-- ============================================================

SELECT
    COUNT(*) AS total_products
FROM products
WHERE price >= 180;



-- ============================================================
-- 15. Count products per manufacturer with price >= $180.
-- ============================================================

SELECT
    m.manufacturer_name,
    COUNT(p.product_id) AS total_products
FROM manufacturers m
LEFT JOIN products p
ON m.manufacturer_id = p.manufacturer_id
WHERE p.price >= 180
GROUP BY m.manufacturer_name;



-- ============================================================
-- 16. List manufacturers with two or more products.
-- ============================================================

SELECT
    m.manufacturer_name,
    COUNT(p.product_id) AS total_products
FROM manufacturers m
LEFT JOIN products p
ON m.manufacturer_id = p.manufacturer_id
GROUP BY m.manufacturer_name
HAVING COUNT(p.product_id) >= 2;



-- ============================================================
-- 17. List manufacturers with products priced >= $220.
-- ============================================================

SELECT
    m.manufacturer_name,
    COUNT(p.product_id) AS total_products
FROM manufacturers m
INNER JOIN products p
ON m.manufacturer_id = p.manufacturer_id
WHERE p.price >= 220
GROUP BY m.manufacturer_name
ORDER BY total_products DESC;
