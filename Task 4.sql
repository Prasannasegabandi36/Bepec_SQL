CREATE TABLE payments (
    payment_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(20)
);
INSERT INTO payments VALUES
('PAY001', 'C01', '2024-03-10', 5000.00, 'UPI'),
('PAY002', 'C01', '2024-03-10', 5000.00, 'UPI'),
('PAY003', 'C02', '2024-03-11', 2500.00, 'Card'),
('PAY004', 'C03', '2024-03-12', 7800.00, 'NetBanking'),
('PAY005', 'C03', '2024-03-12', 7800.00, 'NetBanking'),
('PAY006', 'C03', '2024-03-12', 7800.00, 'UPI'),
('PAY007', 'C04', '2024-03-13', 3200.00, 'Card'),
('PAY008', 'C01', '2024-03-15', 5000.00, 'UPI'),
('PAY009', 'C05', '2024-03-14', 1500.00, 'UPI'),
('PAY010', 'C05', '2024-03-14', 1500.00, 'Card');

SELECT
    customer_id,
    payment_date,
    amount,
    COUNT(*) AS dup_count,
    GROUP_CONCAT(payment_id ORDER BY payment_id SEPARATOR ', ') AS payment_ids
FROM payments
GROUP BY customer_id, payment_date, amount
HAVING COUNT(*) > 1
ORDER BY customer_id, payment_date;