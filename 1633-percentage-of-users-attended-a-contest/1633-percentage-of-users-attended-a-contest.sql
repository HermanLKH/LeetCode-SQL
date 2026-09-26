/* Write your T-SQL query statement below */
SELECT
    contest_id,
    ROUND((CAST(COUNT(DISTINCT user_id) AS FLOAT) / (SELECT COUNT(*) FROM users)) * 100, 2) AS percentage
FROM Register r
GROUP BY contest_id
ORDER BY 
    percentage DESC, 
    contest_id