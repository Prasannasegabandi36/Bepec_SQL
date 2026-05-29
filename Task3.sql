CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);
CREATE TABLE order_items (
    order_item_id VARCHAR(10) PRIMARY KEY,
    order_id INT,
    product_id VARCHAR(10),
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO products VALUES
('P01', 'Wireless Mouse', 'Electronics'),
('P02', 'Mechanical Keyboard', 'Electronics'),
('P03', 'USB-C Hub', 'Electronics'),
('P04', 'Monitor Stand', 'Electronics'),
('P05', 'Notebook A5', 'Stationery'),
('P06', 'Gel Pen Set', 'Stationery'),
('P07', 'Desk Organizer', 'Stationery'),
('P08', 'Sticky Notes Pack', 'Stationery');

INSERT INTO order_items VALUES
('OI01', 1001, 'P01', 10, 599.00),
('OI02', 1001, 'P02', 5, 2499.00),
('OI03', 1002, 'P03', 8, 1299.00),
('OI04', 1002, 'P04', 3, 899.00),
('OI05', 1003, 'P01', 15, 599.00),
('OI06', 1003, 'P05', 50, 120.00),
('OI07', 1004, 'P06', 30, 250.00),
('OI08', 1004, 'P07', 12, 450.00),
('OI09', 1005, 'P08', 20, 80.00),
('OI10', 1005, 'P02', 7, 2499.00),
('OI11', 1006, 'P03', 4, 1299.00),
('OI12', 1006, 'P05', 25, 120.00);

WITH product_revenue AS (
    SELECT
        p.category,
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS total_revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY p.category, p.product_name
),
ranked_products AS (
    SELECT
        category,
        product_name,
        total_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY total_revenue DESC
        ) AS rank_num
    FROM product_revenue
)
SELECT
    category,
    product_name,
    total_revenue,
    rank_num AS product_rank
FROM ranked_products
WHERE rank_num <= 3
ORDER BY category, product_rank;