/*
================================================================================
02_DATA_CLEANING.SQL

Purpose:
Practice cleaning, standardizing, and transforming data.
Includes text standardization, handling values, and formatting columns.

================================================================================
*/


-- ============================================================
-- 1. Convert all product names to uppercase to standardize text.
-- ============================================================

SELECT
    product_id,
    UPPER(product_name) AS product_name,
    price,
    manufacturer_id
FROM products;



-- ============================================================
-- 2. Convert all manufacturer names to lowercase.
-- ============================================================

SELECT
    manufacturer_id,
    LOWER(manufacturer_name) AS manufacturer_name
FROM manufacturers;



-- ============================================================
-- 3. Remove extra spaces from product names.
-- ============================================================

SELECT
    product_id,
    TRIM(product_name) AS product_name
FROM products;



-- ============================================================
-- 4. Display product names with the first letter capitalized.
-- ============================================================

SELECT
    product_name,
    UPPER(SUBSTRING(product_name,1,1)) 
    + LOWER(SUBSTRING(product_name,2,LEN(product_name))) AS formatted_product_name
FROM products;



-- ============================================================
-- 5. Replace characters in product names to standardize values.
-- ============================================================

SELECT
    product_name,
    REPLACE(product_name,'-',' ') AS cleaned_product_name
FROM products;



-- ============================================================
-- 6. Display the length of each product name.
-- ============================================================

SELECT
    product_name,
    LEN(product_name) AS product_name_length
FROM products;



-- ============================================================
-- 7. Identify products with missing manufacturer information.
-- ============================================================

SELECT
    *
FROM products
WHERE manufacturer_id IS NULL;



-- ============================================================
-- 8. Replace NULL manufacturer identifiers with a default value.
-- ============================================================

SELECT
    product_id,
    product_name,
    ISNULL(manufacturer_id,0) AS manufacturer_id
FROM products;



-- ============================================================
-- 9. Replace NULL values using COALESCE.
-- ============================================================

SELECT
    product_id,
    product_name,
    COALESCE(manufacturer_id,0) AS manufacturer_id
FROM products;



-- ============================================================
-- 10. Convert prices into cents.
-- ============================================================

SELECT
    product_name,
    price,
    price * 100 AS cents
FROM products;



-- ============================================================
-- 11. Round product prices to two decimal places.
-- ============================================================

SELECT
    product_name,
    ROUND(price,2) AS price
FROM products;



-- ============================================================
-- 12. Create a standardized manufacturer name column.
-- ============================================================

SELECT
    manufacturer_id,
    UPPER(TRIM(manufacturer_name)) AS standardized_manufacturer_name
FROM manufacturers;



-- ============================================================
-- 13. Identify duplicated manufacturer identifiers in products.
-- ============================================================

SELECT
    manufacturer_id,
    COUNT(*) AS total_records
FROM products
GROUP BY manufacturer_id
HAVING COUNT(*) > 1;



-- ============================================================
-- 14. Remove duplicated manufacturer identifiers from results.
-- ============================================================

SELECT DISTINCT
    manufacturer_id
FROM products;



-- ============================================================
-- 15. Compare product names before and after cleaning.
-- ============================================================

SELECT
    product_name AS original_name,
    UPPER(TRIM(product_name)) AS cleaned_name
FROM products;
