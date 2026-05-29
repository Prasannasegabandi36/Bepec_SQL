CREATE TABLE shipments (
    shipment_id VARCHAR(10) PRIMARY KEY,
    warehouse_id VARCHAR(10),
    ship_date DATE,
    units_shipped INT
);
INSERT INTO shipments VALUES
('S001', 'WH01', '2024-03-01', 2500),
('S002', 'WH01', '2024-03-03', 1800),
('S003', 'WH01', '2024-03-06', 3200),
('S004', 'WH01', '2024-03-10', 1500),
('S005', 'WH01', '2024-03-14', 2700),
('S006', 'WH01', '2024-03-18', 1200),
('S007', 'WH01', '2024-03-22', 900),
('S008', 'WH01', '2024-03-28', 1600),
('S009', 'WH01', '2024-04-02', 4500),
('S010', 'WH01', '2024-04-07', 3800),
('S011', 'WH01', '2024-04-12', 2200);

WITH monthly_running_total AS (
    SELECT
        shipment_id,
        warehouse_id,
        ship_date,
        units_shipped,
        SUM(units_shipped) OVER (
            PARTITION BY warehouse_id, DATE_FORMAT(ship_date, '%Y-%m')
            ORDER BY ship_date
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS running_total
    FROM shipments
    WHERE warehouse_id = 'WH01'
),

threshold_detection AS (
    SELECT
        ship_date,
        units_shipped,
        running_total,
        LAG(running_total) OVER (ORDER BY ship_date) AS prev_running_total
    FROM monthly_running_total
    WHERE DATE_FORMAT(ship_date, '%Y-%m') = '2024-03'
)

SELECT
    ship_date,
    units_shipped,
    running_total,
    CASE
        WHEN running_total > 10000
             AND (prev_running_total IS NULL OR prev_running_total <= 10000)
        THEN 'Yes'
        ELSE 'No'
    END AS threshold_breached
FROM threshold_detection
ORDER BY ship_date;