/* Write your T-SQL query statement below */
WITH CTE_Employee_Department AS
(
    SELECT
        employee_id,
        department_id,
        RANK() OVER(PARTITION BY employee_id ORDER BY primary_flag DESC) rank
    FROM Employee
)
SELECT
    employee_id,
    department_id
FROM CTE_Employee_Department
WHERE rank = 1