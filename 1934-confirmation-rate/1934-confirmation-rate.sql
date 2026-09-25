/* Write your T-SQL query statement below */
SELECT
    s.user_id,
    ROUND(
        AVG(CASE WHEN c.action = 'confirmed' THEN 1.0 ELSE 0.0 END),
        2
    ) AS confirmation_rate
FROM Signups AS s
LEFT JOIN Confirmations AS c
    ON c.user_id = s.user_id
GROUP BY s.user_id;