-- 3.3
CREATE VIEW product_overview AS
SELECT p.product_name, c.category_name, p.unit_price
FROM products p
JOIN categories c ON p.category_id = c.category_id;

SELECT * FROM product_overview ORDER BY product_name;

-- 3.4: 1 prisenhet = 10 SEK, två decimaler
CREATE VIEW product_overview_sek AS
SELECT p.product_name, c.category_name, p.unit_price,
       ROUND((p.unit_price * 10)::numeric, 2) AS price_sek
FROM products p
JOIN categories c ON p.category_id = c.category_id;

SELECT * FROM product_overview_sek ORDER BY product_name;