/* Write your T-SQL query statement below */
SELECT
    MAX(salary) AS SecondHighestSalary
FROM(
    SELECT
        id,
        salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS dr
    FROM Employee
)t
WHERE dr = 2