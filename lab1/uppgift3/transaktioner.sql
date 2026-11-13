-- 3.5 del 1: fungerande transaktion
BEGIN;

UPDATE products SET unit_price = unit_price + 1 WHERE product_id = 1;
UPDATE products SET unit_price = unit_price + 1 WHERE product_id = 2;

SELECT product_id, product_name, unit_price FROM products WHERE product_id IN (1, 2);

ROLLBACK;

SELECT product_id, product_name, unit_price FROM products WHERE product_id IN (1, 2);

-- 3.5 del 2: fel mitt i en transaktion
BEGIN;

UPDATE products SET unit_price = unit_price + 1 WHERE product_id = 1;   -- korrekt

UPDATE products SET unit_pris = unit_price + 1 WHERE product_id = 2;   -- fel: kolumnen finns inte

SELECT product_id, unit_price FROM products WHERE product_id IN (1, 2);

ROLLBACK;

SELECT product_id, product_name, unit_price FROM products WHERE product_id IN (1, 2);