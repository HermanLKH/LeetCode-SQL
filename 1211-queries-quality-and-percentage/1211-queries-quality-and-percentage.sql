/* Write your T-SQL query statement below */
SELECT
    query_name,
    ROUND(AVG(CAST(rating AS FLOAT) / position), 2) AS quality,
    ROUND(AVG(CASE WHEN rating < 3 THEN CAST(1 AS FLOAT) ELSE 0 END) * 100, 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name