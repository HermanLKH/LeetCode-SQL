/* Write your T-SQL query statement below */
WITH CTE_Orders_By_Date AS
(
    SELECT
        order_date,
        customer_pref_delivery_date,
        RANK() OVER(PARTITION BY customer_id ORDER BY order_date) AS order_rank
    FROM Delivery
)
SELECT
    ROUND(AVG(CASE WHEN order_date = customer_pref_delivery_date THEN 1.0 ELSE 0 END) * 100, 2) AS immediate_percentage
FROM CTE_Orders_By_Date
WHERE order_rank = 1