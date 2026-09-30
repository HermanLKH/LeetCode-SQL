/* Write your T-SQL query statement below */
WITH CTE_Manager_Summary AS
(
    SELECT
        reports_to AS manager_id,
        COUNT(employee_id) AS reports_count,
        ROUND(AVG(CAST(age AS FLOAT)), 0) AS average_age
    FROM Employees
    WHERE reports_to IS NOT NULL
    GROUP BY reports_to
)
SELECT
    e.employee_id,
    e.name,
    cms.reports_count,
    cms.average_age
FROM CTE_Manager_Summary cms
INNER JOIN Employees e
ON cms.manager_id = e.employee_id