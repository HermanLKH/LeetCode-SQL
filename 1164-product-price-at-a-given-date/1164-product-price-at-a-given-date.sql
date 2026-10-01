/* Write your T-SQL query statement below */
WITH CTE_Ranked_Products_Price AS
(
    SELECT
        product_id,
        new_price,
        change_date,
        RANK() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS rn
    FROM Products
    WHERE change_date <= '2019-08-16'
)
SELECT
    p.product_id,
    COALESCE(crp.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) AS p
LEFT JOIN CTE_Ranked_Products_Price AS crp
    ON p.product_id = crp.product_id
    AND crp.rn = 1;