--1

SELECT w.name, w.surname, o.date, COUNT(o.bill_id) AS num_bills
FROM Waiters w
JOIN Orders o ON w.waiter_id = o.waiter_id
GROUP BY w.waiter_id, o.date
HAVING COUNT(o.bill_id) >= 2;

--2

SELECT r.room_name, COUNT(t.table_id) AS num_tables
FROM Rooms r
JOIN Tables t ON r.room_id = t.room_id
WHERE t.seats > 6
GROUP BY r.room_name;

--3

SELECT r.room_name, SUM(b.amount_spent) AS total_amount
FROM Rooms r
JOIN Bills b ON r.room_id = b.room_id
GROUP BY r.room_name;

--4

SELECT h.name AS headwaiter_name, h.surname AS headwaiter_surname, SUM(b.amount_spent) AS total_bill_amount
FROM Headwaiters h
JOIN Waiter_Headwaiter wh ON h.headwaiter_id = wh.headwaiter_id
JOIN Waiters w ON wh.waiter_id = w.waiter_id
JOIN Orders o ON w.waiter_id = o.waiter_id
JOIN Bills b ON o.bill_id = b.bill_id
GROUP BY h.headwaiter_id
ORDER BY total_bill_amount DESC;

--5

SELECT c.name
FROM Customers c
JOIN Bills b ON c.customer_id = b.customer_id
GROUP BY c.customer_id
HAVING AVG(b.amount_spent) > 400;

--6

SELECT w.name, w.surname, o.date, COUNT(o.bill_id) AS num_bills
FROM Waiters w
JOIN Orders o ON w.waiter_id = o.waiter_id
GROUP BY w.waiter_id, o.date
HAVING COUNT(o.bill_id) >= 3;
