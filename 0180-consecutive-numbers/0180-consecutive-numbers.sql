/* Write your T-SQL query statement below */
WITH CTE_Logs_Consecutive AS
(
    SELECT
        id,
        num,
        LAG(id, 2) OVER(PARTITION BY num ORDER BY id ) AS first_id
    FROM Logs
)
SELECT
    DISTINCT num AS ConsecutiveNums
FROM CTE_Logs_Consecutive
WHERE id - first_id = 2