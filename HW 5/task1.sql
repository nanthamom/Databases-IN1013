-- Task 1 

-- 1
SELECT bill_date, bill_total
FROM restBill
WHERE cust_name = 'Bob Crow';

--2
SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE '%Smith'
ORDER BY cust_name DESC;

--3
SELECT DISTINCT cust_name
FROM restBill
WHERE SUBSTRING(cust_name, POSITION(' ' IN cust_name) + 1, 1) = 'C';

--4
SELECT DISTINCT r.first_name || ' ' || r.surname AS headwaiter_name
FROM restStaff r
WHERE r.headwaiter IS NULL OR r.staff_no IN (SELECT headwaiter FROM restStaff WHERE headwaiter IS NOT NULL);

--5
SELECT *
FROM restBill
WHERE bill_date BETWEEN 160201 AND 160229;

--6
SELECT DISTINCT bill_date
FROM restBill
WHERE bill_date BETWEEN 150101 AND 151231
ORDER BY bill_date;

-- Task 2 

--1
SELECT SUM(bill_total) AS Income
FROM restBill;

--2
SELECT SUM(bill_total) AS "Feb Income"
FROM restBill
WHERE bill_date BETWEEN 160201 AND 160229;

--3
SELECT AVG(bill_total) AS avg_bill
FROM restBill
WHERE table_no = 002;

--4
SELECT 
    MIN(no_of_seats) AS Min,
    MAX(no_of_seats) AS Max,
    AVG(no_of_seats) AS Avg
FROM restRest_table
WHERE room_name = 'Blue';

--5
SELECT COUNT(DISTINCT table_no) AS distinct_tables
FROM restBill
WHERE waiter_no IN (004, 002);
