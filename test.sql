-- 設問1
SELECT *
FROM users;

-- 設問2
SELECT *
FROM users
WHERE created_at >= '2024-01-01'
AND created_at < '2025-01-01';

-- 設問3
SELECT *
FROM users
WHERE age < 30
AND gender = 'female';

-- 設問4
SELECT product_name, price
FROM products;

-- 設問5
SELECT users.name, orders.order_date
FROM orders
JOIN users
ON orders.user_id = users.id;

-- 設問6
SELECT
    products.product_name,
    order_items.quantity,
    products.price,
    products.price * order_items.quantity AS total_price
FROM order_items
JOIN products
ON order_items.product_id = products.id;

-- 設問7
SELECT
    users.name,
    COUNT(*) AS order_count
FROM users
JOIN orders
ON users.id = orders.user_id
GROUP BY users.id, users.name;

-- 設問8
SELECT
    users.name,
    SUM(products.price * order_items.quantity) AS total_amount
FROM users
JOIN orders
    ON users.id = orders.user_id
JOIN order_items
    ON orders.id = order_items.order_id
JOIN products
    ON order_items.product_id = products.id
GROUP BY users.id, users.name;

-- 設問9
SELECT
    users.name,
    SUM(products.price * order_items.quantity) AS total_amount
FROM users
JOIN orders
    ON users.id = orders.user_id
JOIN order_items
    ON orders.id = order_items.order_id
JOIN products
    ON order_items.product_id = products.id
GROUP BY users.id, users.name
ORDER BY total_amount DESC
LIMIT 1;

-- 設問10
SELECT
    products.product_name,
    SUM(order_items.quantity) AS total_quantity
FROM products
JOIN order_items
    ON products.id = order_items.product_id
GROUP BY products.id, products.product_name;

-- 設問11
SELECT users.*
FROM users
LEFT JOIN orders
    ON users.id = orders.user_id
WHERE orders.id IS NULL;

-- 設問12
SELECT
    order_id
FROM order_items
GROUP BY order_id
HAVING COUNT(product_id) >= 2;

-- 設問13
SELECT DISTINCT
    users.name
FROM users
JOIN orders
    ON users.id = orders.user_id
JOIN order_items
    ON orders.id = order_items.order_id
JOIN products
    ON order_items.product_id = products.id
WHERE products.product_name = 'テレビ';

-- 設問14
SELECT
    orders.order_date,
    users.name,
    products.product_name,
    order_items.quantity,
    products.price * order_items.quantity AS total_price
FROM orders
JOIN users
    ON orders.user_id = users.id
JOIN order_items
    ON orders.id = order_items.order_id
JOIN products
    ON order_items.product_id = products.id;

-- 設問15
SELECT
    products.product_name,
    SUM(order_items.quantity) AS total_quantity
FROM products
JOIN order_items
    ON products.id = order_items.product_id
GROUP BY products.id, products.product_name
ORDER BY total_quantity DESC
LIMIT 1;

-- 設問16
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    COUNT(*) AS order_count
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m');

-- 設問17
SELECT products.*
FROM products
LEFT JOIN order_items
    ON products.id = order_items.product_id
WHERE order_items.id IS NULL;

-- 設問18
CREATE INDEX idx_product_id
ON order_items(product_id);

-- 設問19
SELECT
    t.name,
    AVG(t.order_total) AS avg_amount
FROM (
    SELECT
        users.name,
        orders.id,
        SUM(products.price * order_items.quantity) AS order_total
    FROM users
    JOIN orders
        ON users.id = orders.user_id
    JOIN order_items
        ON orders.id = order_items.order_id
    JOIN products
        ON order_items.product_id = products.id
    GROUP BY users.name, orders.id
) t
GROUP BY t.name;

-- 設問20
SELECT
    users.name,
    MAX(orders.order_date) AS latest_order_date
FROM users
JOIN orders
    ON users.id = orders.user_id
GROUP BY users.id, users.name;

-- 設問21
INSERT INTO users
(id, name, age, gender, created_at)
VALUES
(6, '中村愛', 25, 'female', '2025-06-01');

-- 設問22
INSERT INTO products
(id, product_name, price)
VALUES
(6, 'エアコン', 60000);

-- 設問23
INSERT INTO orders
(id, user_id, order_date)
VALUES
(10, 1, '2025-06-10');

-- 設問24
INSERT INTO order_items
(id, order_id, product_id, quantity)
VALUES
(10, 10, 6, 1);

-- 設問25
UPDATE users
SET age = 24
WHERE name = '田中美咲';

-- 設問26
UPDATE products
SET price = price * 1.1;

-- 設問27
UPDATE orders
SET order_date = '2024-05-01'
WHERE order_date < '2024-05-01';

-- 設問28
DELETE FROM users
WHERE name = '高橋健一';

-- 設問29
DELETE FROM order_items
WHERE order_id = 5;

-- 設問30
DELETE products
FROM products
LEFT JOIN order_items
    ON products.id = order_items.product_id
WHERE order_items.id IS NULL;

