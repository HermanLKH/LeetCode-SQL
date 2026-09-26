/* Write your T-SQL query statement below */
SELECT
    p.product_id,
    COALESCE(ROUND(CAST(SUM(p.price * u.units) AS FLOAT) / SUM(u.units), 2), 0) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
ON
    u.product_id = p.product_id AND
    u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id