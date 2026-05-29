
create table orders (
order_id int,
customer_id varchar(10),
order_date date,
total_amount decimal(10,2),
status varchar(20)
)
INSERT INTO orders (order_id, customer_id, order_date, total_amount, status) VALUES
(1001, 'C01', '2024-01-05', 250.00, 'completed'),
(1002, 'C02', '2024-01-18', 430.00, 'completed'),
(1003, 'C03', '2024-01-22', 120.00, 'cancelled'),
(1004, 'C01', '2024-02-03', 310.00, 'completed'),
(1005, 'C04', '2024-02-14', 560.00, 'completed'),
(1006, 'C02', '2024-02-28', 190.00, 'pending'),
(1007, 'C05', '2024-03-05', 720.00, 'completed'),
(1008, 'C03', '2024-03-12', 150.00, 'completed'),
(1009, 'C01', '2024-03-25', 480.00, 'completed'),
(1010, 'C04', '2024-04-02', 390.00, 'completed'),
(1011, 'C05', '2024-04-15', 210.00, 'completed'),
(1012, 'C02', '2024-04-22', 670.00, 'cancelled');
show tables;
select * from orders;

WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m-01') AS month,
        SUM(total_amount) AS monthly_revenue
    FROM orders
    WHERE status = 'completed'
    GROUP BY DATE_FORMAT(order_date, '%Y-%m-01')
),


select date_format(order_date,'%y-%m-01') as month,
sum (total_amount) as montly_revenue
from orders
where status ='completed'
group by date_format(order_date,'%y-%m-01)

revenue_with_lag AS (
    SELECT
        month,
        monthly_revenue,
        LAG(monthly_revenue) OVER (ORDER BY month) AS prev_month_revenue
    FROM monthly_revenue
)
SELECT
    DATE_FORMAT(month, '%Y-%m') AS month,
    monthly_revenue,
    prev_month_revenue,
    ROUND(
        ((monthly_revenue - prev_month_revenue) / prev_month_revenue) * 100,
        2
    ) AS mom_growth_percent
FROM revenue_with_lag
WHERE prev_month_revenue IS NOT NULL
ORDER BY month;