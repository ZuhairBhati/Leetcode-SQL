# Write your MySQL query statement below
WITH cte AS(
    SELECT customer_number, COUNT(customer_number) AS NumOrd
    FROM Orders
    GROUP BY customer_number
)
SELECT customer_number
FROM cte
WHERE NumOrd = (SELECT MAX(NumOrd) FROM cte)