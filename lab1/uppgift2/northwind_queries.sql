-- 2.1
SELECT first_name, last_name FROM employees;

-- 2.2
SELECT first_name, last_name, home_phone
FROM employees
WHERE title = 'Vice President, Sales';

-- 2.3 
SELECT company_name, contact_name, contact_title
FROM suppliers
WHERE company_name = 'Svensk Sjöföda AB';

-- 2.4 (yngst först = senaste födelsedatum först)
SELECT first_name, last_name, birth_date
FROM employees
ORDER BY birth_date DESC;

-- 2.5
SELECT * FROM customers ORDER BY country, city;

-- 2.6
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%an%';

-- 2.7
SELECT first_name, last_name, title
FROM employees
WHERE title LIKE '%Vice%' OR title LIKE '%President%' OR title LIKE '%Manager%';

-- 2.8
SELECT product_name,
       unit_price,
       unit_price * 1.07 AS price_after_increase
FROM products;

-- 2.9
SELECT product_name, unit_price * units_in_stock AS stock_value
FROM products;

-- 2.10
SELECT product_name, units_in_stock, reorder_level
FROM products
WHERE units_in_stock < reorder_level;

-- 2.11
SELECT product_name, units_in_stock, units_on_order, reorder_level
FROM products
WHERE units_in_stock + units_on_order < reorder_level;

-- 2.12
SELECT p.product_name, c.category_name
FROM products p
JOIN categories c ON p.category_id = c.category_id
WHERE p.product_name = 'Lakkalikööri';

-- 2.13
SELECT p.product_name, s.company_name AS supplier
FROM products p
JOIN suppliers s ON p.supplier_id = s.supplier_id
WHERE p.product_name = 'Gravad lax';

-- 2.14
SELECT p.product_name, s.company_name AS supplier
FROM order_details od
JOIN products p ON od.product_id = p.product_id
JOIN suppliers s ON p.supplier_id = s.supplier_id
WHERE od.order_id = 10249;

-- 2.15
SELECT COUNT(*) AS antal
FROM employees
WHERE title = 'Sales Representative';

-- 2.16 (totalt värde, med hänsyn till rabatt)
SELECT SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_value
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
WHERE o.order_date = '1996-12-12';

-- 2.17
SELECT p.product_name, c.category_name, SUM(od.quantity) AS total_sold
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_name, c.category_name
ORDER BY p.product_name;

-- 2.18 
SELECT c.customer_id, c.company_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 2.19: kolla först vilka som påverkas
SELECT product_id, product_name, unit_price
FROM products
WHERE category_id = 4
ORDER BY product_id;

UPDATE products
SET unit_price = unit_price * 1.20
WHERE category_id = 4;

-- Kontroll efter
SELECT product_id, product_name, unit_price
FROM products
WHERE category_id = 4
ORDER BY product_id;

-- 2.20: kolla först
SELECT p.product_id, p.product_name, p.unit_price
FROM products p
JOIN suppliers s ON p.supplier_id = s.supplier_id
WHERE s.company_name = 'Tokyo Traders'
ORDER BY p.product_id;

UPDATE products
SET unit_price = unit_price * 1.10
WHERE supplier_id = (SELECT supplier_id FROM suppliers WHERE company_name = 'Tokyo Traders');

-- Kontroll efter
SELECT p.product_id, p.product_name, p.unit_price
FROM products p
JOIN suppliers s ON p.supplier_id = s.supplier_id
WHERE s.company_name = 'Tokyo Traders'
ORDER BY p.product_id;