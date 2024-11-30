--1

SELECT c.name
FROM Customers c
WHERE c.customer_id IN (
    SELECT b.customer_id
    FROM Bills b
    JOIN Orders o ON b.bill_id = o.bill_id
    JOIN Waiters w ON o.waiter_id = w.waiter_id
    JOIN Waiter_Headwaiter wh ON w.waiter_id = wh.waiter_id
    JOIN Headwaiters h ON wh.headwaiter_id = h.headwaiter_id
    WHERE h.name = 'Charles'
    GROUP BY b.bill_id
    HAVING MAX(b.amount_spent) > 450.00
);

--2

SELECT h.name, h.surname
FROM Headwaiters h
WHERE h.headwaiter_id = (
    SELECT wh.headwaiter_id
    FROM Waiters w
    JOIN Waiter_Headwaiter wh ON w.waiter_id = wh.waiter_id
    JOIN Orders o ON w.waiter_id = o.waiter_id
    JOIN Customers c ON o.customer_id = c.customer_id
    WHERE c.name = 'Nerida' AND o.date = '2016-01-11'
);

--3

SELECT c.name
FROM Customers c
WHERE c.customer_id = (
    SELECT b.customer_id
    FROM Bills b
    ORDER BY b.amount_spent ASC
    LIMIT 1
);

--4

SELECT w.name, w.surname
FROM Waiters w
WHERE w.waiter_id NOT IN (
    SELECT DISTINCT o.waiter_id
    FROM Orders o
);

--5

SELECT c.name AS customer_name, h.name AS headwaiter_name, h.surname AS headwaiter_surname, r.room_name
FROM Customers c
JOIN Bills b ON c.customer_id = b.customer_id
JOIN Orders o ON b.bill_id = o.bill_id
JOIN Waiters w ON o.waiter_id = w.waiter_id
JOIN Waiter_Headwaiter wh ON w.waiter_id = wh.waiter_id
JOIN Headwaiters h ON wh.headwaiter_id = h.headwaiter_id
JOIN Rooms r ON b.room_id = r.room_id
WHERE b.amount_spent = (
    SELECT MAX(amount_spent)
    FROM Bills
);
