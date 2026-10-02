/* Write your T-SQL query statement below */
WITH CTE_Sales_Summary AS
(
    SELECT
        SUM(amount) AS amount,
        visited_on
    FROM Customer
    GROUP BY visited_on
)
SELECT
    visited_on,
    amount,
    ROUND(average_amount, 2) AS average_amount
FROM (
    SELECT
        visited_on,
        SUM(amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
        AVG(CAST(amount AS FLOAT)) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS average_amount,
        ROW_NUMBER() OVER(ORDER BY visited_on) AS rn
    FROM CTE_Sales_Summary
)t
WHERE rn >= 7