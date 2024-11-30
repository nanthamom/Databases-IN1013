--1

SELECT DISTINCT w.name
FROM Waiters w
JOIN Orders o ON w.waiter_id = o.waiter_id
JOIN Customers c ON o.customer_id = c.customer_id
WHERE c.name = 'Tanya Singh';

--2

SELECT m.date
FROM Management m
JOIN Rooms r ON m.room_id = r.room_id
JOIN Headwaiters h ON m.headwaiter_id = h.headwaiter_id
WHERE h.name = 'Charles'
  AND r.room_name = 'Green'
  AND m.date BETWEEN '2016-02-01' AND '2016-02-29';

--3

SELECT w.name, w.surname
FROM Waiters w
JOIN Waiter_Headwaiter wh ON w.waiter_id = wh.waiter_id
JOIN Headwaiters h ON wh.headwaiter_id = h.headwaiter_id
WHERE h.headwaiter_id = (
    SELECT wh.headwaiter_id
    FROM Waiters w
    JOIN Waiter_Headwaiter wh ON w.waiter_id = wh.waiter_id
    WHERE w.name = 'Zoe' AND w.surname = 'Ball'
);

--4

SELECT c.name AS customer_name, b.amount_spent, w.name AS waiter_name
FROM Bills b
JOIN Customers c ON b.customer_id = c.customer_id
JOIN Orders o ON b.bill_id = o.bill_id
JOIN Waiters w ON o.waiter_id = w.waiter_id
ORDER BY b.amount_spent DESC;

--5

SELECT DISTINCT w.name, w.surname
FROM Waiters w
JOIN Orders o ON w.waiter_id = o.waiter_id
JOIN Bills b ON o.bill_id = b.bill_id
WHERE b.bill_id IN ('00014', '00017')
AND EXISTS (
    SELECT 1
    FROM Orders o2
    JOIN Bills b2 ON o2.bill_id = b2.bill_id
    WHERE b2.bill_id IN ('00014', '00017')
    AND o2.waiter_id = w.waiter_id
);

--6

SELECT w.name, w.surname
FROM Waiters w
JOIN Orders o ON w.waiter_id = o.waiter_id
JOIN Bills b ON o.bill_id = b.bill_id
JOIN Rooms r ON b.room_id = r.room_id
JOIN Management m ON r.room_id = m.room_id
WHERE r.room_name = 'Blue'
  AND m.date = '160312';
