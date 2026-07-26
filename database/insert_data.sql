/*
=====================================================
Database: Store
File: 02_insert_data.sql
Purpose: Populate manufacturers and products tables
=====================================================
*/

USE Store;
GO


BEGIN TRANSACTION;

BEGIN TRY


/*
=====================================================
Insert Manufacturers
=====================================================
*/

INSERT INTO manufacturers 
(manufacturer_id, manufacturer_name)
VALUES
(1, 'Dell'),
(2, 'Apple'),
(3, 'Microsoft'),
(4, 'Acer'),
(5, 'Western Digital'),
(6, 'Kingston'),
(7, 'NVIDIA'),
(8, 'Intel'),
(9, 'AMD'),
(10, 'Logitech'),
(11, 'Canon'),
(12, 'Epson'),
(13, 'Brother'),
(14, 'Razer'),
(15, 'Corsair'),
(16, 'Sony'),
(17, 'LG'),
(18, 'Toshiba'),
(19, 'TP-Link'),
(20, 'Huawei');


/*
=====================================================
Insert Products
=====================================================
*/

INSERT INTO products 
(product_id, product_name, price, manufacturer_id)
VALUES
(1, 'Dell Inspiron 15 Laptop', 749.99, 1),
(2, 'Dell XPS 13 Laptop', 1199.99, 1),
(3, 'Dell UltraSharp 27 Monitor', 499.99, 1),
(4, 'MacBook Air M3', 1099.99, 2),
(5, 'MacBook Pro 14 M3', 1999.99, 2),
(6, 'iPad Pro 12.9', 1299.99, 2),
(7, 'Surface Laptop 6', 1399.99, 3),
(8, 'Surface Pro 10', 999.99, 3),
(9, 'Acer Aspire 5 Laptop', 549.99, 4),
(10, 'Acer Predator Gaming Laptop', 1599.99, 4),
(11, 'Acer Nitro Gaming Monitor', 349.99, 4),
(12, 'WD Blue SSD 1TB', 89.99, 5),
(13, 'WD Black SSD 2TB', 179.99, 5),
(14, 'WD External Drive 4TB', 129.99, 5),
(15, 'Kingston Fury RAM 16GB', 69.99, 6),
(16, 'Kingston Fury RAM 32GB', 119.99, 6),
(17, 'Kingston NV2 SSD 1TB', 79.99, 6),
(18, 'NVIDIA RTX 4060 Graphics Card', 299.99, 7),
(19, 'NVIDIA RTX 4070 Graphics Card', 599.99, 7),
(20, 'NVIDIA RTX 4080 Graphics Card', 999.99, 7),
(21, 'Intel Core i5 Processor', 189.99, 8),
(22, 'Intel Core i7 Processor', 329.99, 8),
(23, 'Intel Core i9 Processor', 499.99, 8),
(24, 'AMD Ryzen 5 Processor', 159.99, 9),
(25, 'AMD Ryzen 7 Processor', 299.99, 9),
(26, 'AMD Ryzen 9 Processor', 499.99, 9),
(27, 'Logitech MX Master Mouse', 99.99, 10),
(28, 'Logitech Wireless Keyboard', 59.99, 10),
(29, 'Canon Pixma Printer', 149.99, 11),
(30, 'Canon EOS Camera', 799.99, 11),
(31, 'Epson EcoTank Printer', 299.99, 12),
(32, 'Epson Scanner Pro', 199.99, 12),
(33, 'Brother Laser Printer', 249.99, 13),
(34, 'Razer Gaming Mouse', 79.99, 14),
(35, 'Razer Gaming Keyboard', 129.99, 14),
(36, 'Corsair Gaming RAM 32GB', 139.99, 15),
(37, 'Corsair Power Supply 750W', 119.99, 15),
(38, 'Sony Wireless Headphones', 349.99, 16),
(39, 'Sony 4K Camera', 899.99, 16),
(40, 'LG UltraWide Monitor', 599.99, 17),
(41, 'LG OLED Display', 1299.99, 17),
(42, 'Toshiba External Hard Drive', 109.99, 18),
(43, 'TP-Link WiFi Router AX3000', 89.99, 19),
(44, 'TP-Link Mesh System', 199.99, 19),
(45, 'Huawei MateBook Laptop', 899.99, 20),
(46, 'Huawei Tablet Pro', 499.99, 20),
(47, 'Dell Gaming Desktop', 1499.99, 1),
(48, 'Apple Magic Keyboard', 99.99, 2),
(49, 'Intel Wireless Adapter', 39.99, 8),
(50, 'AMD Radeon Graphics Card', 449.99, 9);
	

COMMIT TRANSACTION;


END TRY


BEGIN CATCH

    ROLLBACK TRANSACTION;

    THROW;

END CATCH;
GO
