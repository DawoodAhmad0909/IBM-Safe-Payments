CREATE DATABASE IBM_pay_db;
USE IBM_pay_db;

CREATE TABLE Customers(
	customer_id INT PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	email VARCHAR(50) ,
	phone VARCHAR(15) ,
	registration_date DATE,
	credit_score INT,
	is_active BOOLEAN
);

SELECT * FROM Customers;

INSERT INTO Customers VALUES
	(101, 'John', 'Smith', 'john.smith@email.com', '+15551234567', '2023-01-15', 750, TRUE),
	(102, 'Maria', 'Garcia', 'maria.g@email.com', '+15559876543', '2023-03-22', 680, TRUE),
	(103, 'James', 'Johnson', 'j.johnson@email.com', '+15551112222', '2023-05-10', 820, TRUE),
	(104, 'Sarah', 'Williams', 'sarah.w@email.com', '+15553334444', '2023-02-18', 710, TRUE),
	(105, 'Robert', 'Brown', 'robert.b@email.com', '+15555556666', '2023-04-05', 650, FALSE),
	(106, 'Emily', 'Davis', 'emily.d@email.com', '+15557778888', '2023-06-30', 780, TRUE),
	(107, 'Michael', 'Miller', 'michael.m@email.com', '+15559990000', '2023-01-28', 720, TRUE),
	(108, 'Jessica', 'Wilson', 'jessica.w@email.com', '+15551231234', '2023-07-15', 690, TRUE),
	(109, 'David', 'Moore', 'david.m@email.com', '+15552345678', '2023-08-22', 830, TRUE),
	(110, 'Jennifer', 'Taylor', 'jennifer.t@email.com', '+15553456789', '2023-09-10', 760, TRUE),
	(111, 'Daniel', 'Anderson', 'daniel.a@email.com', '+15554567890', '2023-10-18', 710, FALSE),
	(112, 'Lisa', 'Thomas', 'lisa.t@email.com', '+15555678901', '2023-11-05', 670, TRUE),
	(113, 'Mark', 'Jackson', 'mark.j@email.com', '+15556789012', '2023-12-30', 790, TRUE),
	(114, 'Nancy', 'White', 'nancy.w@email.com', '+15557890123', '2024-01-28', 740, TRUE),
	(115, 'Paul', 'Harris', 'paul.h@email.com', '+15558901234', '2024-02-15', 810, TRUE),
	(116, 'Laura', 'Martin', 'laura.m@email.com', '+15559012345', '2024-03-22', 730, TRUE),
	(117, 'Kevin', 'Thompson', 'kevin.t@email.com', '+15550123456', '2024-04-10', 680, FALSE),
	(118, 'Amy', 'Gonzalez', 'amy.g@email.com', '+15551234567', '2024-05-18', 770, TRUE),
	(119, 'Brian', 'Clark', 'brian.c@email.com', '+15552345678', '2024-06-05', 850, TRUE),
	(120, 'Rachel', 'Lewis', 'rachel.l@email.com', '+15553456789', '2024-07-30', 790, TRUE);
	
CREATE TABLE Accounts(
	account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    open_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

SELECT * FROM Accounts;

INSERT INTO Accounts VALUES
	(1001, 101, 'checking', 12500.00, '2023-01-20'),
	(1002, 101, 'savings', 54300.00, '2023-01-20'),
	(1003, 102, 'checking', 8700.00, '2023-03-25'),
	(1004, 102, 'credit', -2500.00, '2023-03-25'),
	(1005, 103, 'checking', 23100.00, '2023-05-15'),
	(1006, 103, 'savings', 76500.00, '2023-05-15'),
	(1007, 104, 'checking', 14200.00, '2023-02-20'),
	(1008, 104, 'credit', -1800.00, '2023-02-20'),
	(1009, 105, 'checking', 9800.00, '2023-04-10'),
	(1010, 105, 'savings', 32000.00, '2023-04-10'),
	(1011, 106, 'checking', 17600.00, '2023-07-05'),
	(1012, 106, 'credit', -3200.00, '2023-07-05'),
	(1013, 107, 'checking', 20500.00, '2023-02-03'),
	(1014, 107, 'savings', 48700.00, '2023-02-03'),
	(1015, 108, 'checking', 11200.00, '2023-07-20'),
	(1016, 108, 'credit', -4100.00, '2023-07-20'),
	(1017, 109, 'checking', 29800.00, '2023-08-25'),
	(1018, 109, 'savings', 62100.00, '2023-08-25'),
	(1019, 110, 'checking', 15400.00, '2023-09-15'),
	(1020, 110, 'credit', -2900.00, '2023-09-15'),
	(1021, 111, 'checking', 13200.00, '2023-10-23'),
	(1022, 111, 'savings', 37800.00, '2023-10-23'),
	(1023, 112, 'checking', 18700.00, '2023-11-10'),
	(1024, 112, 'credit', -2200.00, '2023-11-10'),
	(1025, 113, 'checking', 24300.00, '2023-12-30'),
	(1026, 113, 'savings', 52900.00, '2023-12-30'),
	(1027, 114, 'checking', 16500.00, '2024-02-03'),
	(1028, 114, 'credit', -3500.00, '2024-02-03'),
	(1029, 115, 'checking', 27600.00, '2024-02-20'),
	(1030, 115, 'savings', 71200.00, '2024-02-20'),
	(1031, 116, 'checking', 19800.00, '2024-03-25'),
	(1032, 116, 'credit', -2700.00, '2024-03-25'),
	(1033, 117, 'checking', 12100.00, '2024-04-15'),
	(1034, 117, 'savings', 45600.00, '2024-04-15'),
	(1035, 118, 'checking', 22300.00, '2024-05-23'),
	(1036, 118, 'credit', -3800.00, '2024-05-23'),
	(1037, 119, 'checking', 31200.00, '2024-06-10'),
	(1038, 119, 'savings', 68400.00, '2024-06-10'),
	(1039, 120, 'checking', 14300.00, '2024-08-05'),
	(1040, 120, 'credit', -1900.00, '2024-08-05');

CREATE TABLE Transactions(
	transaction_id BIGINT PRIMARY KEY,
    account_id INT,
    transaction_datetime DATETIME,
    amount DECIMAL(10,2),
    merchant_name VARCHAR(35),
    merchant_category VARCHAR(20),
    transaction_type VARCHAR(20),
    is_foreign BOOLEAN,
    is_online BOOLEAN,
    ip_address VARCHAR(30),
    device_id VARCHAR(25),
    is_fraud BOOLEAN,
    fraud_type VARCHAR(20),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

SELECT * FROM Transactions;

INSERT INTO Transactions VALUES
	(50000001, 1001, '2024-06-10 09:30:45', 129.99, 'Amazon', 'e-commerce', 'purchase', FALSE, TRUE, '192.168.1.1', 'device123', FALSE, 'none'),
	(50000002, 1003, '2024-06-10 11:15:22', 45.50, 'Starbucks', 'food', 'purchase', FALSE, FALSE, NULL, 'terminal456', FALSE, 'none'),
	(50000003, 1005, '2024-06-10 12:45:18', 78.30, 'Walmart', 'retail', 'purchase', FALSE, FALSE, NULL, 'terminal789', FALSE, 'none'),
	(50000004, 1007, '2024-06-10 13:20:33', 23.75, 'CVS', 'pharmacy', 'purchase', FALSE, FALSE, NULL, 'terminal012', FALSE, 'none'),
	(50000005, 1009, '2024-06-10 14:55:07', 150.00, 'Verizon', 'utilities', 'purchase', FALSE, TRUE, '192.168.1.2', 'device456', FALSE, 'none'),
	(50000006, 1011, '2024-06-10 16:30:44', 65.20, 'Whole Foods', 'grocery', 'purchase', FALSE, FALSE, NULL, 'terminal345', FALSE, 'none'),
	(50000007, 1013, '2024-06-10 18:05:29', 29.99, 'Netflix', 'entertainment', 'purchase', FALSE, TRUE, '192.168.1.3', 'device789', FALSE, 'none'),
	(50000008, 1015, '2024-06-10 19:40:15', 42.80, 'Uber', 'transportation', 'purchase', FALSE, TRUE, '192.168.1.4', 'device012', FALSE, 'none'),
	(50000009, 1017, '2024-06-10 21:15:52', 95.00, 'Best Buy', 'electronics', 'purchase', FALSE, FALSE, NULL, 'terminal678', FALSE, 'none'),
	(50000010, 1019, '2024-06-11 08:20:37', 210.00, 'Home Depot', 'home_improvement', 'purchase', FALSE, FALSE, NULL, 'terminal901', FALSE, 'none'),
	(50000011, 1021, '2024-06-11 10:05:14', 55.25, 'Target', 'retail', 'purchase', FALSE, FALSE, NULL, 'terminal234', FALSE, 'none'),
	(50000012, 1023, '2024-06-11 11:40:58', 18.50, 'McDonald''s', 'food', 'purchase', FALSE, FALSE, NULL, 'terminal567', FALSE, 'none'),
	(50000013, 1025, '2024-06-11 13:15:43', 320.00, 'Apple Store', 'electronics', 'purchase', FALSE, TRUE, '192.168.1.5', 'device345', FALSE, 'none'),
	(50000014, 1027, '2024-06-11 14:50:26', 72.90, 'Chevron', 'gas', 'purchase', FALSE, FALSE, NULL, 'terminal890', FALSE, 'none'),
	(50000015, 1029, '2024-06-11 16:25:11', 28.75, 'Starbucks', 'food', 'purchase', FALSE, FALSE, NULL, 'terminal123', FALSE, 'none'),
	(50000016, 1031, '2024-06-11 18:00:54', 135.00, 'Nordstrom', 'apparel', 'purchase', FALSE, FALSE, NULL, 'terminal456', FALSE, 'none'),
	(50000017, 1033, '2024-06-11 19:35:39', 49.99, 'Spotify', 'entertainment', 'purchase', FALSE, TRUE, '192.168.1.6', 'device678', FALSE, 'none'),
	(50000018, 1035, '2024-06-11 21:10:22', 62.40, 'Domino''s', 'food', 'purchase', FALSE, TRUE, '192.168.1.7', 'device901', FALSE, 'none'),
	(50000019, 1037, '2024-06-12 08:45:07', 175.00, 'Lowe''s', 'home_improvement', 'purchase', FALSE, FALSE, NULL, 'terminal234', FALSE, 'none'),
	(50000020, 1039, '2024-06-12 10:20:50', 33.20, 'Walgreens', 'pharmacy', 'purchase', FALSE, FALSE, NULL, 'terminal567', FALSE, 'none'),
	(50000021, 1002, '2024-06-12 11:55:33', 500.00, 'Bank Transfer', 'transfer', 'transfer', FALSE, TRUE, '192.168.1.8', 'device123', FALSE, 'none'),
	(50000022, 1004, '2024-06-12 13:30:16', 85.00, 'AT&T', 'utilities', 'purchase', FALSE, TRUE, '192.168.1.9', 'device456', FALSE, 'none'),
	(50000023, 1006, '2024-06-12 15:05:59', 22.50, 'Subway', 'food', 'purchase', FALSE, FALSE, NULL, 'terminal890', FALSE, 'none'),
	(50000024, 1008, '2024-06-12 16:40:42', 42.00, 'Shell', 'gas', 'purchase', FALSE, FALSE, NULL, 'terminal123', FALSE, 'none'),
	(50000025, 1010, '2024-06-12 18:15:25', 68.75, 'Costco', 'grocery', 'purchase', FALSE, FALSE, NULL, 'terminal456', FALSE, 'none'),
	(50000026, 1012, '2024-06-12 19:50:08', 29.99, 'Hulu', 'entertainment', 'purchase', FALSE, TRUE, '192.168.1.10', 'device789', FALSE, 'none'),
	(50000027, 1014, '2024-06-12 21:25:51', 155.00, 'Macy''s', 'apparel', 'purchase', FALSE, FALSE, NULL, 'terminal789', FALSE, 'none'),
	(50000028, 1016, '2024-06-13 08:30:34', 72.30, 'Exxon', 'gas', 'purchase', FALSE, FALSE, NULL, 'terminal012', FALSE, 'none'),
	(50000029, 1018, '2024-06-13 10:05:17', 210.00, 'IKEA', 'home_improvement', 'purchase', FALSE, FALSE, NULL, 'terminal345', FALSE, 'none'),
	(50000030, 1020, '2024-06-13 11:40:00', 45.60, 'Pizza Hut', 'food', 'purchase', FALSE, TRUE, '192.168.1.11', 'device012', FALSE, 'none'),
	(50000031, 1022, '2024-06-13 13:15:43', 90.00, 'TJ Maxx', 'apparel', 'purchase', FALSE, FALSE, NULL, 'terminal678', FALSE, 'none'),
	(50000032, 1024, '2024-06-13 14:50:26', 28.50, 'Dunkin''', 'food', 'purchase', FALSE, FALSE, NULL, 'terminal901', FALSE, 'none'),
	(50000033, 1026, '2024-06-13 16:25:09', 125.00, 'Bank Deposit', 'deposit', 'deposit', FALSE, TRUE, '192.168.1.12', 'device345', FALSE, 'none'),
	(50000034, 1028, '2024-06-13 18:00:52', 38.75, '7-Eleven', 'convenience', 'purchase', FALSE, FALSE, NULL, 'terminal234', FALSE, 'none'),
	(50000035, 1030, '2024-06-13 19:35:35', 62.00, 'Chili''s', 'food', 'purchase', FALSE, TRUE, '192.168.1.13', 'device678', FALSE, 'none'),
	(50000036, 1032, '2024-06-13 21:10:18', 29.99, 'Disney+', 'entertainment', 'purchase', FALSE, TRUE, '192.168.1.14', 'device901', FALSE, 'none'),
	(50000037, 1034, '2024-06-14 08:45:01', 180.00, 'Bed Bath & Beyond', 'home_improvement', 'purchase', FALSE, FALSE, NULL, 'terminal567', FALSE, 'none'),
	(50000038, 1036, '2024-06-14 10:20:44', 52.25, 'BP', 'gas', 'purchase', FALSE, FALSE, NULL, 'terminal890', FALSE, 'none'),
	(50000039, 1038, '2024-06-14 11:55:27', 75.50, 'Kroger', 'grocery', 'purchase', FALSE, FALSE, NULL, 'terminal123', FALSE, 'none'),
	(50000040, 1040, '2024-06-14 13:30:10', 32.00, 'Panera Bread', 'food', 'purchase', FALSE, TRUE, '192.168.1.15', 'device234', FALSE, 'none'),
	(50000041, 1001, '2024-06-14 15:05:53', 250.00, 'Bank Transfer', 'transfer', 'transfer', FALSE, TRUE, '192.168.1.16', 'device567', FALSE, 'none'),
	(50000042, 1003, '2024-06-14 16:40:36', 19.99, 'Wal-Mart', 'retail', 'purchase', FALSE, FALSE, NULL, 'terminal901', FALSE, 'none'),
	(50000043, 1005, '2024-06-14 18:15:19', 42.50, 'Shell', 'gas', 'purchase', FALSE, FALSE, NULL, 'terminal234', FALSE, 'none'),
	(50000044, 1007, '2024-06-14 19:50:02', 68.00, 'Trader Joe''s', 'grocery', 'purchase', FALSE, FALSE, NULL, 'terminal567', FALSE, 'none'),
	(50000045, 1009, '2024-06-14 21:25:45', 29.99, 'HBO Max', 'entertainment', 'purchase', FALSE, TRUE, '192.168.1.17', 'device890', FALSE, 'none');


SELECT  is_online,COUNT(*) AS Total_Transactions FROM Transactions
GROUP BY  is_online;


SELECT merchant_category, ROUND(AVG(amount),2) AS Average_Amount FROM Transactions
GROUP BY merchant_category;


SELECT account_id, DATE(transaction_datetime) AS Transaction_date, COUNT(*) AS Total_transactions FROM Transactions
 GROUP BY account_id, Transaction_date
 HAVING COUNT(*) >5;


SELECT * FROM Transactions
WHERE amount>1000.00 AND HOUR(transaction_datetime) BETWEEN 0 AND 5;


SELECT * FROM Transactions
WHERE amount>=9500.00 AND amount<10000.00 ;


 SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) AS Customer_Name 
 FROM Customers AS c
 JOIN Accounts AS a ON c.customer_id=a.customer_id
 JOIN Transactions AS t1 ON t1.account_id=a.account_id AND t1.amount>500
 JOIN Transactions AS t2 ON t2.account_id=a.account_id AND t2.amount<5
 WHERE TIMESTAMPDIFF(HOUR,t2.transaction_datetime,t1.transaction_datetime)<=24;
 

SELECT
	c.customer_id AS Customer_id,
	CONCAT(c.first_name,' ',c.last_name) AS Customer_Name, 
    SUM(t.amount)/(TIMESTAMPDIFF(HOUR,MIN(t.transaction_datetime),(MAX(t.transaction_datetime)))) AS Spending_velocity
FROM Transactions AS t 
JOIN Accounts AS a ON a.account_id=t.account_id
JOIN Customers AS c ON c.customer_id=a.customer_id
WHERE c.is_active=TRUE
GROUP BY c.customer_id;
 

 WITH MonthlyStats AS (
  SELECT 
    a.customer_id,
    DATE_FORMAT(t.transaction_datetime, '%Y-%m') AS transaction_month,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount
  FROM transactions t
  JOIN Accounts a ON t.account_id = a.account_id
  GROUP BY a.customer_id, transaction_month
),
ThisMonth AS (
  SELECT * FROM MonthlyStats
  WHERE transaction_month = DATE_FORMAT(CURRENT_DATE(), '%Y-%m')
),
Last3Months AS (
  SELECT customer_id,
         AVG(transaction_count) AS avg_transaction_count,
         AVG(total_amount) AS avg_total_amount
  FROM MonthlyStats
  WHERE transaction_month BETWEEN DATE_FORMAT(DATE_SUB(CURRENT_DATE(), INTERVAL 3 MONTH), '%Y-%m')
                      AND DATE_FORMAT(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY), '%Y-%m')
  GROUP BY customer_id
)
SELECT tm.customer_id
FROM ThisMonth tm
JOIN Last3Months lm ON tm.customer_id = lm.customer_id
WHERE tm.transaction_count > 2 * lm.avg_transaction_count OR tm.total_amount > 2 * lm.avg_total_amount;
 
 
 SELECT account_id,YEARWEEK(transaction_datetime) AS week,COUNT(DISTINCT device_id) AS Login_Devices
 FROM TransactionS
 GROUP BY account_id,YEARWEEK(transaction_datetime)
 HAVING  Login_Devices>3;
 

WITH Last90Transactions AS (
  SELECT account_id, MAX(transaction_datetime) AS last_transaction
  FROM Transactions
  GROUP BY account_id
),
Dormant AS (
  SELECT account_id FROM Last90Transactions
  WHERE last_transaction < DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)
),
RecentTransactions AS (
  SELECT DISTINCT account_id
  FROM Transactions
  WHERE transaction_datetime >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY)
)
SELECT d.account_id
FROM Dormant d
JOIN RecentTransactions r ON d.account_id = r.account_id;
    

WITH MonthlyCounts AS (
  SELECT 
    account_id,
    DATE_FORMAT(transaction_datetime, '%Y-%m') AS transaction_month,
    COUNT(*) AS total_transactions
  FROM Transactions
  GROUP BY account_id, DATE_FORMAT(transaction_datetime, '%Y-%m')
),
Current AS (
  SELECT * FROM MonthlyCounts
  WHERE transaction_month = DATE_FORMAT(CURRENT_DATE(), '%Y-%m')
),
Previous AS (
  SELECT * FROM MonthlyCounts
  WHERE transaction_month = DATE_FORMAT(DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH), '%Y-%m')
)
SELECT c.account_id
FROM Current c
JOIN Previous p ON c.account_id = p.account_id
WHERE c.total_transactions >= 2 * p.total_transactions;


SELECT DISTINCT d.account_id
FROM transactions d
JOIN transactions w 
  ON d.account_id = w.account_id
  AND w.transaction_type = 'withdrawal' AND w.amount > 1000
  AND TIMESTAMPDIFF(DAY, d.transaction_datetime, w.transaction_datetime) <= 2
WHERE d.transaction_type = 'deposit' AND d.amount < 100;



WITH UsualCategories AS (
  SELECT account_id, merchant_category,
         COUNT(*) AS category_count
  FROM transactions
  GROUP BY account_id, merchant_category
),
TopCategory AS (
  SELECT uc1.account_id, uc1.merchant_category
  FROM UsualCategories uc1
  JOIN (
    SELECT account_id, MAX(category_count) AS max_count
    FROM UsualCategories
    GROUP BY account_id
  ) uc2 ON uc1.account_id = uc2.account_id AND uc1.category_count = uc2.max_count
)
SELECT t.*
FROM transactions t
LEFT JOIN TopCategory tc 
  ON t.account_id = tc.account_id AND t.merchant_category = tc.merchant_category
WHERE tc.merchant_category IS NULL;


SELECT t1.*
FROM transactions t1
JOIN transactions t2 
  ON t1.account_id = t2.account_id
  AND t1.merchant_name = t2.merchant_name
  AND ABS(TIMESTAMPDIFF(MINUTE, t1.transaction_datetime, t2.transaction_datetime)) <= 15
  AND ABS(t1.amount - t2.amount) BETWEEN 0.01 AND 2.00
  AND t1.transaction_id <> t2.transaction_id;
