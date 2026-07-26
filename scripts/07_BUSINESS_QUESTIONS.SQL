/*
================================================================================
07_BUSINESS_QUESTIONS.SQL

Purpose:
Solve business-oriented questions using SQL.
These exercises simulate real Data Analyst tasks:
- Product analysis
- Manufacturer performance
- Pricing analysis
- Market opportunities
- Data-driven decisions

================================================================================
*/


-- ============================================================
-- 1. How many products does each manufacturer have?
-- Include manufacturers without products.
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
-- 2. Which manufacturer has the highest number of products?
-- ============================================================

SELECT TOP 1
    m.manufacturer_name,
    COUNT(p.product_id) AS total_products
FROM manufacturers m
INNER JOIN products p
ON m.manufacturer_id = p.manufacturer_id
GROUP BY m.manufacturer_name
ORDER BY total_products DESC;



-- ============================================================
-- 3. What is the average product price by manufacturer?
-- ============================================================

SELECT
    m.manufacturer_name,
    AVG(p.price) AS average_price
FROM manufacturers m
INNER JOIN products p
ON m.manufacturer_id = p.manufacturer_id
GROUP BY m.manufacturer_name
ORDER BY average_price DESC;



-- ============================================================
-- 4. Which manufacturers have products with an average price
-- higher than the overall average price?
-- ============================================================

SELECT
    m.manufacturer_name,
    AVG(p.price) AS average_price
FROM manufacturers m
INNER JOIN products p
ON m.manufacturer_id = p.manufacturer_id
GROUP BY m.manufacturer_name
HAVING AVG(p.price) >
(
    SELECT AVG(price)
    FROM products
);



-- ============================================================
-- 5. What are the top 5 most expensive products?
-- ============================================================

SELECT TOP 5
    product_name,
    price
FROM products
ORDER BY price DESC;



-- ============================================================
-- 6. What are the 5 cheapest products?
-- ============================================================

SELECT TOP 5
    product_name,
    price
FROM products
ORDER BY price ASC;



-- ============================================================
-- 7. Which manufacturer produces the most expensive product?
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
-- 8. Which manufacturers do not have any products?
-- Identify inactive manufacturers.
-- ============================================================

SELECT
    m.manufacturer_name
FROM manufacturers m
LEFT JOIN products p
ON m.manufacturer_id = p.manufacturer_id
WHERE p.product_id IS NULL;



-- ============================================================
-- 9. Which products are priced above the average market price?
-- ============================================================

SELECT
    product_name,
    price
FROM products
WHERE price >
(
    SELECT AVG(price)
    FROM products
)
ORDER BY price DESC;



-- ============================================================
-- 10. How many products are considered expensive?
-- Products above $400.
-- ============================================================

SELECT
    COUNT(*) AS expensive_products
FROM products
WHERE price > 400;



-- ============================================================
-- 11. How many products belong to each price range?
-- ============================================================

SELECT
    CASE
        WHEN price < 100 THEN 'Low Price'
        WHEN price BETWEEN 100 AND 300 THEN 'Medium Price'
        ELSE 'High Price'
    END AS price_category,
    COUNT(*) AS total_products
FROM products
GROUP BY
    CASE
        WHEN price < 100 THEN 'Low Price'
        WHEN price BETWEEN 100 AND 300 THEN 'Medium Price'
        ELSE 'High Price'
    END;



-- ============================================================
-- 12. What is the price range (minimum and maximum)
-- for each manufacturer?
-- ============================================================

SELECT
    m.manufacturer_name,
    MIN(p.price) AS minimum_price,
    MAX(p.price) AS maximum_price
FROM manufacturers m
INNER JOIN products p
ON m.manufacturer_id = p.manufacturer_id
GROUP BY m.manufacturer_name;



-- ============================================================
-- 13. Which manufacturers have more than 5 products?
-- ============================================================

SELECT
    m.manufacturer_name,
    COUNT(p.product_id) AS total_products
FROM manufacturers m
INNER JOIN products p
ON m.manufacturer_id = p.manufacturer_id
GROUP BY m.manufacturer_name
HAVING COUNT(p.product_id) > 5;



-- ============================================================
-- 14. Rank manufacturers by number of products.
-- ============================================================

SELECT
    m.manufacturer_name,
    COUNT(p.product_id) AS total_products,
    RANK() OVER
    (
        ORDER BY COUNT(p.product_id) DESC
    ) AS manufacturer_rank
FROM manufacturers m
LEFT JOIN products p
ON m.manufacturer_id = p.manufacturer_id
GROUP BY m.manufacturer_name;



-- ============================================================
-- 15. Identify products that are more expensive than
-- their manufacturer's average price.
-- ============================================================

SELECT
    p.product_name,
    p.price,
    m.manufacturer_name
FROM products p
INNER JOIN manufacturers m
ON p.manufacturer_id = m.manufacturer_id
WHERE p.price >
(
    SELECT AVG(p2.price)
    FROM products p2
    WHERE p2.manufacturer_id = p.manufacturer_id
);



-- ============================================================
-- 16. Find the most expensive product for each manufacturer.
-- ============================================================

SELECT
    m.manufacturer_name,
    p.product_name,
    p.price
FROM products p
INNER JOIN manufacturers m
ON p.manufacturer_id = m.manufacturer_id
WHERE p.price =
(
    SELECT MAX(p2.price)
    FROM products p2
    WHERE p2.manufacturer_id = p.manufacturer_id
)
ORDER BY m.manufacturer_name;



-- ============================================================
-- 17. Which manufacturers have products below the average price?
-- ============================================================

SELECT
    m.manufacturer_name,
    COUNT(p.product_id) AS products_below_average
FROM manufacturers m
INNER JOIN products p
ON m.manufacturer_id = p.manufacturer_id
WHERE p.price <
(
    SELECT AVG(price)
    FROM products
)
GROUP BY m.manufacturer_name;



-- ============================================================
-- 18. Create a business summary report:
-- Manufacturer, number of products,
-- average price and maximum price.
-- ============================================================

SELECT
    m.manufacturer_name,
    COUNT(p.product_id) AS total_products,
    AVG(p.price) AS average_price,
    MAX(p.price) AS highest_price
FROM manufacturers m
LEFT JOIN products p
ON m.manufacturer_id = p.manufacturer_id
GROUP BY m.manufacturer_name
ORDER BY total_products DESC;

-- ============================================================
-- 19. How many products belong to each price category?
-- categories:
--  - Budget < $200
--  - Mid-range $200 - $800
--  - Premium >$800
-- ============================================================
WITH price_products AS(
SELECT
    product_id,
    SUM(PRICE) AS total_price
FROM products
GROUP BY product_id
)
, product_category AS(
SELECT
    product_id,
    CASE WHEN total_price < 200 THEN 'Budget'
         WHEN total_price BETWEEN 200 AND 800 THEN 'Mid-range'
         ELSE 'Premium'
    END AS category
FROM price_products 
)
SELECT
    COUNT(product_id) AS total_products,
    Category
FROM product_category
GROUP BY category 
ORDER BY category DESC
