# IBM-Safe-Payments
## Overview
Database:IBM_pay_db
The IBM_pay_db database is a comprehensive financial dataset designed to simulate the structure and operations of a digital banking platform. It includes three interconnected tables: Customers, Accounts, and Transactions. Each table captures essential details relevant to real-world banking operations. The schema supports customer profiling, account management, and transaction tracking. This setup is ideal for performing advanced analytics such as customer behavior analysis, fraud detection, and financial forecasting.
## Objectives
1. Design a Relational Schema:
Create normalized tables to store customer details, account information, and transaction history with appropriate data types, constraints, and relationships.

2. Establish Data Relationships:
Implement foreign key constraints to maintain referential integrity between customers, accounts, and transactions.

3. Populate the Database:
Insert realistic and varied data to mimic a functioning banking system, including online, foreign, and in-person transactions.

4. Prepare for Advanced Use Cases:
Structure data to facilitate future integration with machine learning models, dashboards, or business intelligence tools.
## Database Creation
```sql
CREATE DATABASE IBM_pay_db;
USE IBM_pay_db;
```
## Table Creation
### Table:Customers
```sql
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
```
### Table:Accounts

```sql
CREATE TABLE Accounts(
        account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    open_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

SELECT * FROM Accounts;
```
### Table:Transactions
```sql
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
```
## Key Queries
#### 1. How many transactions were conducted online versus in-person?
```sql
SELECT  is_online,COUNT(*) AS Total_Transactions FROM Transactions
GROUP BY  is_online;
```
#### 2. What is the average transaction amount for each merchant category?
```sql
SELECT merchant_category, ROUND(AVG(amount),2) AS Average_Amount FROM Transactions
GROUP BY merchant_category;
```
#### 3. Which accounts have more than 5 transactions in a single day?
```sql
SELECT account_id, DATE(transaction_datetime) AS Transaction_date, COUNT(*) AS Total_transactions FROM Transactions
 GROUP BY account_id, Transaction_date
 HAVING COUNT(*) >5;
```
#### 4. Identify transactions with amounts exceeding $1000 that occurred between midnight and 5 AM.
```sql
SELECT * FROM Transactions
WHERE amount>1000.00 AND HOUR(transaction_datetime) BETWEEN 0 AND 5;
```
#### 6. Detect potential money laundering: transactions just below $10,000 (common reporting threshold).
```sql
SELECT * FROM Transactions
WHERE amount>=9500.00 AND amount<10000.00 ;
```
#### 7. Which customers have both a high-value purchase (>$500) and a small test transaction (<$5) within 24 hours?
```sql
 SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) AS Customer_Name 
 FROM Customers AS c
 JOIN Accounts AS a ON c.customer_id=a.customer_id
 JOIN Transactions AS t1 ON t1.account_id=a.account_id AND t1.amount>500
 JOIN Transactions AS t2 ON t2.account_id=a.account_id AND t2.amount<5
 WHERE TIMESTAMPDIFF(HOUR,t2.transaction_datetime,t1.transaction_datetime)<=24;
```
#### 8. Calculate the spending velocity (total amount spent per hour) for each active customer.
```sql
SELECT
        c.customer_id AS Customer_id,
        CONCAT(c.first_name,' ',c.last_name) AS Customer_Name, 
    SUM(t.amount)/(TIMESTAMPDIFF(HOUR,MIN(t.transaction_datetime),(MAX(t.transaction_datetime)))) AS Spending_velocity
FROM Transactions AS t 
JOIN Accounts AS a ON a.account_id=t.account_id
JOIN Customers AS c ON c.customer_id=a.customer_id
WHERE c.is_active=TRUE
GROUP BY c.customer_id;
```
#### 9. Find customers whose transaction patterns significantly changed this month (compared to their 3-month average).
```sql
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
```
#### 10. List accounts with login attempts from more than 3 different devices in a week.
```sql
SELECT account_id,YEARWEEK(transaction_datetime) AS week,COUNT(DISTINCT device_id) AS Login_Devices
 FROM TransactionS
 GROUP BY account_id,YEARWEEK(transaction_datetime)
 HAVING  Login_Devices>3;
```
#### 11. Identify dormant accounts (no transactions for 90+ days) that suddenly became active.
```WITH Last90Transactions AS (
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
```
#### 12. Find accounts where the transaction frequency doubled compared to the previous month.
```WITH MonthlyCounts AS (
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
```
#### 13. Detect "pump-and-dump" patterns: small recurring deposits followed by a large withdrawal.
```sql
SELECT DISTINCT d.account_id
FROM transactions d
JOIN transactions w 
  ON d.account_id = w.account_id
  AND w.transaction_type = 'withdrawal' AND w.amount > 1000
  AND TIMESTAMPDIFF(DAY, d.transaction_datetime, w.transaction_datetime) <= 2
WHERE d.transaction_type = 'deposit' AND d.amount < 100;

```
#### 14. Find transactions where the merchant category doesn't match the account's usual spending habits.
```sql
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
```
#### 15. Identify potential card skimming: sequential transactions at the same merchant with slightly varying amounts.
```sql
SELECT t1.*
FROM transactions t1
JOIN transactions t2 
  ON t1.account_id = t2.account_id
  AND t1.merchant_name = t2.merchant_name
  AND ABS(TIMESTAMPDIFF(MINUTE, t1.transaction_datetime, t2.transaction_datetime)) <= 15
  AND ABS(t1.amount - t2.amount) BETWEEN 0.01 AND 2.00
  AND t1.transaction_id <> t2.transaction_id;
```
Here’s a clear overview, objectives, and conclusion for your IBM_pay_db project:
## Conclusion

The IBM_pay_db project successfully simulates a modern financial database, reflecting real-world digital banking operations. It provides a robust platform for data analysis, supporting both transactional and analytical workloads. With well-defined relationships and realistic sample data, the database can be used for educational purposes, prototype development, fraud detection exercises, and machine learning applications in fintech scenarios. This structured approach ensures scalability, clarity, and readiness for more advanced financial data modeling.


