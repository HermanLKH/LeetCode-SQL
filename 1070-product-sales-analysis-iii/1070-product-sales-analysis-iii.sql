/* Write your T-SQL query statement below */

SELECT
    product_id,
    year AS first_year,
    quantity,
    price
FROM
(
    SELECT
        product_id,
        year,
        quantity,
        price,
        RANK() OVER(PARTITION BY product_id ORDER BY year) AS seq_by_product_year
    FROM Sales
)t
WHERE seq_by_product_year = 1