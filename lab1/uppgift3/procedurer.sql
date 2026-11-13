-- 3.1
CREATE PROCEDURE raise_all_prices()
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE products
    SET unit_price = unit_price * 1.05;
END;
$$;

-- Före
SELECT product_id, product_name, unit_price FROM products ORDER BY product_id LIMIT 5;

CALL raise_all_prices();

-- Efter
SELECT product_id, product_name, unit_price FROM products ORDER BY product_id LIMIT 5;

-- 3.2 
CREATE PROCEDURE raise_prices_by_category(p_category_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE products
    SET unit_price = unit_price * 1.05
    WHERE category_id = p_category_id;
END;
$$;

-- Före: en produkt i kategori 1 och en i en annan kategori
SELECT product_id, product_name, category_id, unit_price
FROM products
WHERE category_id IN (1, 2)
ORDER BY category_id, product_id;

CALL raise_prices_by_category(1);

-- Efter: bara kategori 1 ska ha ändrats
SELECT product_id, product_name, category_id, unit_price
FROM products
WHERE category_id IN (1, 2)
ORDER BY category_id, product_id;