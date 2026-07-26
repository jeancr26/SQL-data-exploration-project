/*
================================================================================
06_SUBQUERIES.SQL

Purpose:
Practice using subqueries to solve problems by nesting queries.
Includes:
- Scalar subqueries
- Subqueries with IN
- Correlated subqueries
- EXISTS
- Comparisons with aggregate results

================================================================================
*/


-- ============================================================
-- 1. List all products with a price higher than the average price.
-- ============================================================

SELECT
    product_name,
    price
FROM products
WHERE price >
(
    SELECT AVG(price)
    FROM products
);



-- ============================================================
-- 2. List all products with the highest price.
-- ============================================================

SELECT
    product_name,
    price
FROM products
WHERE price =
(
    SELECT MAX(price)
    FROM products
);



-- ============================================================
-- 3. List all products with the lowest price.
-- ============================================================

SELECT
    product_name,
    price
FROM products
WHERE price =
(
    SELECT MIN(price)
    FROM products
);



-- ============================================================
-- 4. List products that belong to manufacturers
-- that have more than 3 products.
-- ============================================================

SELECT
    product_name,
    manufacturer_id
FROM products
WHERE manufacturer_id IN
(
    SELECT
        manufacturer_id
    FROM products
    GROUP BY manufacturer_id
    HAVING COUNT(*) > 3
);



-- ============================================================
-- 5. List manufacturers that have at least one product.
-- Using IN.
-- ============================================================

SELECT
    manufacturer_name
FROM manufacturers
WHERE manufacturer_id IN
(
    SELECT DISTINCT
        manufacturer_id
    FROM products
);



-- ============================================================
-- 6. List manufacturers that do not have products.
-- Using NOT IN.
-- ============================================================

SELECT
    manufacturer_name
FROM manufacturers
WHERE manufacturer_id NOT IN
(
    SELECT DISTINCT
        manufacturer_id
    FROM products
);



-- ============================================================
-- 7. List products more expensive than Lenovo's average price.
-- ============================================================

SELECT
    product_name,
    price
FROM products
WHERE price >
(
    SELECT AVG(p.price)
    FROM products p
    INNER JOIN manufacturers m
    ON p.manufacturer_id = m.manufacturer_id
    WHERE m.manufacturer_name = 'Lenovo'
);



-- ============================================================
-- 8. List products with the same price as the most expensive product.
-- ============================================================

SELECT
    product_name,
    price
FROM products
WHERE price =
(
    SELECT MAX(price)
    FROM products
);



-- ============================================================
-- 9. List manufacturers whose average product price
-- is greater than the overall average price.
-- ============================================================

SELECT
    manufacturer_id,
    AVG(price) AS average_price
FROM products
GROUP BY manufacturer_id
HAVING AVG(price) >
(
    SELECT AVG(price)
    FROM products
);



-- ============================================================
-- 10. List products from manufacturers that exist in the database.
-- Using EXISTS.
-- ============================================================

SELECT
    p.product_name,
    p.price
FROM products p
WHERE EXISTS
(
    SELECT 1
    FROM manufacturers m
    WHERE m.manufacturer_id = p.manufacturer_id
);



-- ============================================================
-- 11. List manufacturers without products.
-- Using NOT EXISTS.
-- ============================================================

SELECT
    m.manufacturer_name
FROM manufacturers m
WHERE NOT EXISTS
(
    SELECT 1
    FROM products p
    WHERE p.manufacturer_id = m.manufacturer_id
);



-- ============================================================
-- 12. Find products with prices higher than all products
-- from manufacturer ID 2.
-- ============================================================

SELECT
    product_name,
    price
FROM products
WHERE price >
ALL
(
    SELECT price
    FROM products
    WHERE manufacturer_id = 2
);



-- ============================================================
-- 13. Find products with prices higher than any product
-- from manufacturer ID 2.
-- ============================================================

SELECT
    product_name,
    price
FROM products
WHERE price >
ANY
(
    SELECT price
    FROM products
    WHERE manufacturer_id = 2
);



-- ============================================================
-- 14. List products whose manufacturer has an average price
-- greater than $200.
-- ============================================================

SELECT
    p.product_name,
    p.price,
    p.manufacturer_id
FROM products p
WHERE p.manufacturer_id IN
(
    SELECT
        manufacturer_id
    FROM products
    GROUP BY manufacturer_id
    HAVING AVG(price) > 200
);



-- ============================================================
-- 15. Return the second most expensive product.
-- ============================================================

SELECT
    product_name,
    price
FROM products
WHERE price =
(
    SELECT MAX(price)
    FROM products
    WHERE price <
    (
        SELECT MAX(price)
        FROM products
    )
);



-- ============================================================
-- 16. Return products that are above the average price
-- of their manufacturer.
-- Correlated subquery.
-- ============================================================

SELECT
    p.product_name,
    p.price,
    p.manufacturer_id
FROM products p
WHERE p.price >
(
    SELECT AVG(p2.price)
    FROM products p2
    WHERE p2.manufacturer_id = p.manufacturer_id
);



-- ============================================================
-- 17. Return the manufacturer with the highest average price.
-- ============================================================

SELECT
    manufacturer_id,
    AVG(price) AS average_price
FROM products
GROUP BY manufacturer_id
HAVING AVG(price) =
(
    SELECT MAX(avg_price)
    FROM
    (
        SELECT
            AVG(price) AS avg_price
        FROM products
        GROUP BY manufacturer_id
    ) AS averages
);
