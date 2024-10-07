# Write your MySQL query statement below
WITH cte AS (
SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary, 
       MAX(e.salary) OVER(PARTITION BY e.departmentId) AS max_salary
FROM Employee e
LEFT JOIN Department d
ON e.departmentId = d.id
)

SELECT Department, Employee, Salary
FROM cte
WHERE salary = max_salary
