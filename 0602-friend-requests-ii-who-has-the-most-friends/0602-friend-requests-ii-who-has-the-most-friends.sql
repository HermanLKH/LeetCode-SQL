/* Write your T-SQL query statement below */
SELECT TOP(1)
    accepter_id AS id,
    SUM(num) AS num
FROM (
    SELECT
        COUNT(accept_date) AS num,
        accepter_id
    FROM RequestAccepted
    GROUP BY accepter_id
    UNION ALL
    SELECT
        COUNT(accept_date) AS num,
        requester_id
    FROM RequestAccepted
    GROUP BY requester_id
)t
GROUP BY accepter_id
ORDER BY num DESC
