-- 1. INNER JOIN
	-- Returns only rows where there is a match in clients and orders table
SELECT clients.name, orders.product
FROM clients
INNER JOIN orders
ON clients.client_id = orders.client_id;

-- 2. LEFT JOIN
	-- Returns all clients and matching orders (NULL if no match)
SELECT clients.name, orders.product
FROM clients
LEFT JOIN orders
ON clients.client_id = orders.client_id;

-- 3. RIGHT JOIN
	-- Returns all orders and matching clients (NULL if no match)
SELECT c.name, o.product
FROM orders o
LEFT JOIN clients c
ON c.client_id = o.client_id;

-- 4. FULL OUTER JOIN (we use UNION)
	-- Returns all rows from both tables, matching where possible
SELECT c.name, o.product
FROM clients c
LEFT JOIN orders o
ON c.client_id = o.client_id
UNION
SELECT c.name, o.product
FROM clients c
RIGHT JOIN orders o
ON c.client_id = o.client_id;

-- 5.1 LEFT ANTI JOIN (NOT EXISTS version)
	-- Returns clients that do NOT have any orders
SELECT *
FROM clients c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.client_id = c.client_id
);

-- 5.2 LEFT ANTI JOIN (LEFT JOIN version)
	-- Returns clients that do NOT have any orders
SELECT c.*
FROM clients c
LEFT JOIN orders o ON c.client_id = o.client_id
WHERE o.client_id IS NULL;

-- 6.1 RIGHT ANTI JOIN (NOT EXISTS version)
	-- Returns orders that do NOT have a matching client
SELECT *
FROM orders o
WHERE NOT EXISTS (
    SELECT 1
    FROM clients c
    WHERE c.client_id = o.client_id
);

-- 6.2 RIGHT ANTI JOIN (LEFT JOIN version)
	-- Returns orders that do NOT have a matching client
SELECT o.*
FROM orders o
LEFT JOIN clients c
ON c.client_id = o.client_id
WHERE c.client_id IS NULL;

-- 7. CROSS JOIN
	-- Returns all possible combinations between clients and orders
SELECT c.name, o.product
FROM clients c
CROSS JOIN orders o;

-- 8. SELF JOIN
	-- Joins table with itself to compare rows
SELECT a.name, b.name
FROM clients a
JOIN clients b 
  ON a.client_id <> b.client_id;

-- 9. SEMI JOIN (EXISTS)
	-- Returns clients that have at least one order
SELECT *
FROM clients c
WHERE EXISTS (
  SELECT 1
  FROM orders o
  WHERE o.client_id = c.client_id
);
