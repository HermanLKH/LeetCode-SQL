/* Write your T-SQL query statement below */
WITH CTE_RankedEmployees AS
(
    SELECT
        name,
        salary,
        departmentId,
        DENSE_RANK() OVER (
            PARTITION BY departmentId
            ORDER BY salary DESC
        ) AS salary_rank
    FROM Employee
)
SELECT
    d.name AS Department,
    cre.name AS Employee,
    cre.salary AS Salary
FROM CTE_RankedEmployees cre
INNER JOIN Department d
    ON d.id = cre.departmentId
WHERE cre.salary_rank <= 3;