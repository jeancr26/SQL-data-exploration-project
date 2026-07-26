/*
=====================================================
Database: Store
Purpose: Create product and manufacturer dataset
Author: Jean Carlos Rodriguez
=====================================================
*/

USE master;
GO

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Store')
BEGIN
    DROP DATABASE Store;
END;
GO

CREATE DATABASE Store;
GO

USE Store;
GO


/*
Create manufacturers table
*/

CREATE TABLE manufacturers
(
    manufacturer_id INT IDENTITY(1,1) PRIMARY KEY,
    manufacturer_name VARCHAR(100) NOT NULL
);


/*
Create products table
*/

CREATE TABLE products
(
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name NVARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    manufacturer_id INT NOT NULL,

    CONSTRAINT FK_products_manufacturers
    FOREIGN KEY (manufacturer_id)
    REFERENCES manufacturers(manufacturer_id)
);
