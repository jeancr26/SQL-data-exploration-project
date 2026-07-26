/*
================================================================================
01_DATA_EXPLORATION.SQL

Purpose:
Basic exploration of the products and manufacturers tables.
Retrieve columns, inspect data, transform values, and understand table structure.

================================================================================
*/


-- ============================================================
-- 1. List the name of all products in the products table.
-- ============================================================

SELECT
    product_name
FROM products;



-- ============================================================
-- 2. List the names and prices of all products.
-- ============================================================

SELECT
    product_name,
    price
FROM products;



-- ============================================================
-- 3. List all columns from the products table.
-- ============================================================

SELECT
    *
FROM products;



-- ============================================================
-- 4. List product names, prices converted to USD and EUR.
-- ============================================================

SELECT
    product_name,
    price * 58.25 AS dollars,
    price * 66.29 AS euros
FROM products;



-- ============================================================
-- 5. List product names and prices using column aliases.
-- ============================================================

SELECT
    product_name AS product_name,
    price * 58.25 AS dollars,
    price * 66.29 AS euros
FROM products;



-- ============================================================
-- 6. Convert product names to uppercase.
-- ============================================================

SELECT
    UPPER(product_name) AS product_name,
    price
FROM products;



-- ============================================================
-- 7. Convert product names to lowercase.
-- ============================================================

SELECT
    LOWER(product_name) AS product_name,
    price
FROM products;



-- ============================================================
-- 8. Display manufacturer names and capitalize the first two characters.
-- ============================================================

SELECT
    manufacturer_name,
    UPPER(SUBSTRING(manufacturer_name,1,2)) AS manufacturer_initial
FROM manufacturers;



-- ============================================================
-- 9. Display product names and round product prices.
-- ============================================================

SELECT
    product_name,
    ROUND(price,2) AS price
FROM products;



-- ============================================================
-- 10. List all manufacturer identifiers that have products.
-- ============================================================

SELECT
    m.manufacturer_id
FROM manufacturers m
INNER JOIN products p
ON m.manufacturer_id = p.manufacturer_id;



-- ============================================================
-- 11. List unique manufacturer identifiers that have products.
-- ============================================================

SELECT DISTINCT
    m.manufacturer_id
FROM manufacturers m
INNER JOIN products p
ON m.manufacturer_id = p.manufacturer_id;



-- ============================================================
-- 12. List manufacturer names sorted alphabetically ascending.
-- ============================================================

SELECT
    manufacturer_name
FROM manufacturers
ORDER BY manufacturer_name ASC;



-- ============================================================
-- 13. List manufacturer names sorted alphabetically descending.
-- ============================================================

SELECT
    manufacturer_name
FROM manufacturers
ORDER BY manufacturer_name DESC;



-- ============================================================
-- 14. List products sorted by product name ascending.
-- ============================================================

SELECT
    product_name,
    price
FROM products
ORDER BY product_name ASC;



-- ============================================================
-- 15. List products sorted by price descending.
-- ============================================================

SELECT
    product_name,
    price
FROM products
ORDER BY price DESC;



-- ============================================================
-- 16. Return the first 5 rows from the manufacturers table.
-- ============================================================

SELECT TOP 5
    *
FROM manufacturers;



-- ============================================================
-- 17. Return 2 rows starting from the fourth row of manufacturers.
-- ============================================================

SELECT TOP 2
    *
FROM
(
    SELECT
        ROW_NUMBER() OVER(ORDER BY manufacturer_id) AS row_number,
        *
    FROM manufacturers
) AS t
WHERE row_number >= 4;



-- ============================================================
-- 18. List the cheapest product using ORDER BY.
-- ============================================================

SELECT TOP 1
    product_name,
    price
FROM products
ORDER BY price ASC;



-- ============================================================
-- 19. List the most expensive product using ORDER BY.
-- ============================================================

SELECT TOP 1
    product_name,
    price
FROM products
ORDER BY price DESC;



-- ============================================================
-- 20. Display product names, prices, and manufacturer names.
-- ============================================================

SELECT
    p.product_name,
    p.price,
    m.manufacturer_name
FROM products p
INNER JOIN manufacturers m
ON p.manufacturer_id = m.manufacturer_id;



-- ============================================================
-- 21. Display product information with manufacturer names sorted alphabetically.
-- ============================================================

SELECT
    p.product_name,
    p.price,
    m.manufacturer_name
FROM products p
INNER JOIN manufacturers m
ON p.manufacturer_id = m.manufacturer_id
ORDER BY m.manufacturer_name ASC;



-- ============================================================
-- 22. Display product ID, product name, manufacturer ID, and manufacturer name.
-- ============================================================

SELECT
    p.product_id,
    p.product_name,
    m.manufacturer_id,
    m.manufacturer_name
FROM products p
INNER JOIN manufacturers m
ON p.manufacturer_id = m.manufacturer_id;
