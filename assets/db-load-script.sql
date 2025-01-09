CREATE DATABASE IF NOT EXISTS ashiqdb;
USE ashiqdb;

CREATE TABLE IF NOT EXISTS products (
    id mediumint(8) unsigned NOT NULL auto_increment,
    Name varchar(255) DEFAULT NULL,
    Price varchar(255) DEFAULT NULL,
    ImageUrl varchar(255) DEFAULT NULL,
    PRIMARY KEY (id)
) AUTO_INCREMENT=1;

INSERT INTO products (Name, Price, ImageUrl)
SELECT * FROM (SELECT "Laptop", "100", "c-1.png") AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM products WHERE Name="Laptop" AND Price="100" AND ImageUrl="c-1.png"
)
UNION ALL
SELECT * FROM (SELECT "Drone", "200", "c-2.png") AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM products WHERE Name="Drone" AND Price="200" AND ImageUrl="c-2.png"
)
UNION ALL
SELECT * FROM (SELECT "VR", "300", "c-3.png") AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM products WHERE Name="VR" AND Price="300" AND ImageUrl="c-3.png"
)
UNION ALL
SELECT * FROM (SELECT "Tablet", "50", "c-5.png") AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM products WHERE Name="Tablet" AND Price="50" AND ImageUrl="c-5.png"
)
UNION ALL
SELECT * FROM (SELECT "Watch", "90", "c-6.png") AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM products WHERE Name="Watch" AND Price="90" AND ImageUrl="c-6.png"
)
UNION ALL
SELECT * FROM (SELECT "Phone Covers", "20", "c-7.png") AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM products WHERE Name="Phone Covers" AND Price="20" AND ImageUrl="c-7.png"
)
UNION ALL
SELECT * FROM (SELECT "Phone", "80", "c-8.png") AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM products WHERE Name="Phone" AND Price="80" AND ImageUrl="c-8.png"
)
UNION ALL
SELECT * FROM (SELECT "Laptop", "150", "c-4.png") AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM products WHERE Name="Laptop" AND Price="150" AND ImageUrl="c-4.png"
);
