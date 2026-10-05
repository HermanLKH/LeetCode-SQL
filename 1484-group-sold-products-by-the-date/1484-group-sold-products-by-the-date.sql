/* Write your T-SQL query statement below */
SELECT
    sell_date,
    COUNT(*) AS num_sold,
    STRING_AGG(product, ',')
        WITHIN GROUP (ORDER BY product) AS products
FROM (
    SELECT DISTINCT sell_date, product FROM Activities
)t
GROUP BY sell_date
ORDER BY sell_date
