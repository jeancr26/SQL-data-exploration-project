/*
================================================================================
05_JOINS.SQL

Purpose:
Practice combining data from multiple tables using:
INNER JOIN, LEFT JOIN and RIGHT JOIN.

Tables:
products
manufacturers

================================================================================
*/


-- ============================================================
-- 1. Return product name, price and manufacturer name
-- for all products.
-- ============================================================

SELECT
    p.product_name,
    p.price,
    m.manufacturer_name
FROM products p
INNER JOIN manufacturers m
ON p.manufacturer_id = m.manufacturer_id;



-- ============================================================
-- 2. Return product information ordered by manufacturer name.
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
-- 3. Return product ID, product name,
-- manufacturer ID and manufacturer name.
-- ============================================================

SELECT
    p.product_id,
    p.product_name,
    m.manufacturer_id,
    m.manufacturer_name
FROM products p
INNER JOIN manufacturers m
ON p.manufacturer_id = m.manufacturer_id;



-- ============================================================
-- 4. Return the cheapest product with its manufacturer name.
-- ============================================================

SELECT TOP 1
    p.product_name,
    p.price,
    m.manufacturer_name
FROM products p
INNER JOIN manufacturers m
ON p.manufacturer_id = m.manufacturer_id
ORDER BY p.price ASC;



-- ============================================================
-- 5. Return the most expensive product with its manufacturer name.
-- ============================================================

SELECT TOP 1
    p.product_name,
    p.price,
    m.manufacturer_name
FROM products p
INNER JOIN manufacturers m
ON p.manufacturer_id = m.manufacturer_id
ORDER BY p.price DESC;



-- ============================================================
-- 6. Return all products manufactured by Lenovo.
-- ============================================================

SELECT
    p.product_name,
    m.manufacturer_name
FROM products p
INNER JOIN manufacturers m
ON p.manufacturer_id = m.manufacturer_id
WHERE m.manufacturer_name = 'Lenovo';



-- ============================================================
-- 7. Return products from Asus, Hewlett-Packard
-- and Seagate manufacturers.
-- ============================================================

SELECT
    p.product_name,
    m.manufacturer_name
FROM products p
INNER JOIN manufacturers m
ON p.manufacturer_id = m.manufacturer_id
WHERE m.manufacturer_name IN
(
    'Asus',
    'Hewlett-Packard',
    'Seagate'
);



-- ============================================================
-- 8. Return all manufacturers that have products.
-- ============================================================

SELECT
    m.manufacturer_id,
    m.manufacturer_name
FROM manufacturers m
INNER JOIN products p
ON m.manufacturer_id = p.manufacturer_id
GROUP BY
    m.manufacturer_id,
    m.manufacturer_name;



-- ============================================================
-- 9. Return all manufacturers and their products.
-- Include manufacturers without products.
-- ============================================================

SELECT
    m.manufacturer_id,
    m.manufacturer_name,
    p.product_name
FROM manufacturers m
LEFT JOIN products p
ON m.manufacturer_id = p.manufacturer_id;



-- ============================================================
-- 10. Return only manufacturers without products.
-- ============================================================

SELECT
    m.manufacturer_id,
    m.manufacturer_name
FROM manufacturers m
LEFT JOIN products p
ON m.manufacturer_id = p.manufacturer_id
WHERE p.product_id IS NULL;



-- ============================================================
-- 11. Return all manufacturers using RIGHT JOIN.
-- Include manufacturers without products.
-- ============================================================

SELECT
    m.manufacturer_id,
    m.manufacturer_name,
    p.product_name
FROM products p
RIGHT JOIN manufacturers m
ON p.manufacturer_id = m.manufacturer_id;



-- ============================================================
-- 12. Return manufacturers without associated products
-- using RIGHT JOIN.
-- ============================================================

SELECT
    m.manufacturer_id,
    m.manufacturer_name
FROM products p
RIGHT JOIN manufacturers m
ON p.manufacturer_id = m.manufacturer_id
WHERE p.product_id IS NULL;



-- ============================================================
-- 13. Return manufacturer name and total products.
-- Include manufacturers with zero products.
-- ============================================================

SELECT
    m.manufacturer_name,
    COUNT(p.product_id) AS total_products
FROM manufacturers m
LEFT JOIN products p
ON m.manufacturer_id = p.manufacturer_id
GROUP BY m.manufacturer_name;



-- ============================================================
-- 14. Return all products with manufacturer information,
-- sorted by manufacturer and product name.
-- ============================================================

SELECT
    m.manufacturer_name,
    p.product_name,
    p.price
FROM manufacturers m
INNER JOIN products p
ON m.manufacturer_id = p.manufacturer_id
ORDER BY
    m.manufacturer_name ASC,
    p.product_name ASC;



-- ============================================================
-- 15. Return products with manufacturers where price
-- is greater than $200.
-- ============================================================

SELECT
    p.product_name,
    p.price,
    m.manufacturer_name
FROM products p
INNER JOIN manufacturers m
ON p.manufacturer_id = m.manufacturer_id
WHERE p.price > 200;



-- ============================================================
-- 16. Return all manufacturers and their most expensive product.
-- ============================================================

SELECT
    m.manufacturer_name,
    MAX(p.price) AS highest_price
FROM manufacturers m
LEFT JOIN products p
ON m.manufacturer_id = p.manufacturer_id
GROUP BY m.manufacturer_name;



-- ============================================================
-- 17. Return manufacturers that have products priced
-- greater than or equal to $220.
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
