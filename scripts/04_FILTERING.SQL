/*
================================================================================
04_FILTERING.SQL

Purpose:
Practice filtering data using:
WHERE, AND, OR, NOT, IN, BETWEEN, LIKE and comparison operators.

================================================================================
*/


-- ============================================================
-- 1. List products with a price lower than or equal to $120.
-- ============================================================

SELECT
    product_name,
    price
FROM products
WHERE price <= 120;



-- ============================================================
-- 2. List products with a price greater than or equal to $400.
-- ============================================================

SELECT
    product_name,
    price
FROM products
WHERE price >= 400;



-- ============================================================
-- 3. List products that are not priced above $400.
-- ============================================================

SELECT
    product_name,
    price
FROM products
WHERE price <= 400;



-- ============================================================
-- 4. List products priced between $80 and $300 without BETWEEN.
-- ============================================================

SELECT
    product_name,
    price
FROM products
WHERE price >= 80
AND price <= 300;



-- ============================================================
-- 5. List products priced between $60 and $200 using BETWEEN.
-- ============================================================

SELECT
    product_name,
    price
FROM products
WHERE price BETWEEN 60 AND 200;



-- ============================================================
-- 6. List products with a price greater than $200
-- and manufacturer ID equal to 6.
-- ============================================================

SELECT
    product_name,
    price,
    manufacturer_id
FROM products
WHERE price > 200
AND manufacturer_id = 6;



-- ============================================================
-- 7. List products from manufacturers 1, 3 or 5 without IN.
-- ============================================================

SELECT
    product_name,
    manufacturer_id
FROM products
WHERE manufacturer_id = 1
OR manufacturer_id = 3
OR manufacturer_id = 5;



-- ============================================================
-- 8. List products from manufacturers 1, 3 or 5 using IN.
-- ============================================================

SELECT
    product_name,
    manufacturer_id
FROM products
WHERE manufacturer_id IN (1,3,5);



-- ============================================================
-- 9. List products excluding manufacturers Asus,
-- Hewlett-Packard and Seagate without NOT IN.
-- ============================================================

SELECT
    p.product_name,
    m.manufacturer_name
FROM products p
INNER JOIN manufacturers m
ON p.manufacturer_id = m.manufacturer_id
WHERE m.manufacturer_name <> 'Asus'
AND m.manufacturer_name <> 'Hewlett-Packard'
AND m.manufacturer_name <> 'Seagate';



-- ============================================================
-- 10. List products excluding manufacturers Asus,
-- Hewlett-Packard and Seagate using NOT IN.
-- ============================================================

SELECT
    p.product_name,
    m.manufacturer_name
FROM products p
INNER JOIN manufacturers m
ON p.manufacturer_id = m.manufacturer_id
WHERE m.manufacturer_name NOT IN
(
    'Asus',
    'Hewlett-Packard',
    'Seagate'
);



-- ============================================================
-- 11. List manufacturers whose name starts with letter S.
-- ============================================================

SELECT
    manufacturer_name
FROM manufacturers
WHERE manufacturer_name LIKE 'S%';



-- ============================================================
-- 12. List manufacturers whose name ends with letter e.
-- ============================================================

SELECT
    manufacturer_name
FROM manufacturers
WHERE manufacturer_name LIKE '%e';



-- ============================================================
-- 13. List manufacturers whose name contains letter w.
-- ============================================================

SELECT
    manufacturer_name
FROM manufacturers
WHERE manufacturer_name LIKE '%w%';



-- ============================================================
-- 14. List manufacturers whose name has exactly 4 characters.
-- ============================================================

SELECT
    manufacturer_name
FROM manufacturers
WHERE LEN(manufacturer_name) = 4;



-- ============================================================
-- 15. List products containing the word "Laptop".
-- ============================================================

SELECT
    product_name
FROM products
WHERE product_name LIKE '%Laptop%';



-- ============================================================
-- 16. List products containing "Monitor"
-- with a price lower than $215.
-- ============================================================

SELECT
    product_name,
    price
FROM products
WHERE product_name LIKE '%Monitor%'
AND price < 215;



-- ============================================================
-- 17. List products with price greater than or equal to $180.
-- Sort by price descending.
-- ============================================================

SELECT
    product_name,
    price
FROM products
WHERE price >= 180
ORDER BY price DESC;



-- ============================================================
-- 18. List products with price greater than or equal to $180.
-- Sort by product name ascending.
-- ============================================================

SELECT
    product_name,
    price
FROM products
WHERE price >= 180
ORDER BY product_name ASC;



-- ============================================================
-- 19. List products from manufacturer Lenovo.
-- ============================================================

SELECT
    p.product_name,
    m.manufacturer_name
FROM products p
INNER JOIN manufacturers m
ON p.manufacturer_id = m.manufacturer_id
WHERE m.manufacturer_name = 'Lenovo';



-- ============================================================
-- 20. List products with manufacturer ID equal to 2.
-- ============================================================

SELECT
    product_name,
    manufacturer_id
FROM products
WHERE manufacturer_id = 2;



-- ============================================================
-- 21. List products with prices not equal to $500.
-- ============================================================

SELECT
    product_name,
    price
FROM products
WHERE price <> 500;



-- ============================================================
-- 22. List products with prices greater than $100
-- and lower than $300.
-- ============================================================

SELECT
    product_name,
    price
FROM products
WHERE price > 100
AND price < 300;



-- ============================================================
-- 23. List products where manufacturer information exists.
-- ============================================================

SELECT
    *
FROM products
WHERE manufacturer_id IS NOT NULL;



-- ============================================================
-- 24. List products where manufacturer information is missing.
-- ============================================================

SELECT
    *
FROM products
WHERE manufacturer_id IS NULL;
