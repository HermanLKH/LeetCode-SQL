/* Write your T-SQL query statement below */
DELETE FROM Person
WHERE id IN (
    SELECT id
    FROM(
        SELECT
            id,
            email,
            ROW_NUMBER() OVER(PARTITION BY email ORDER BY id) AS rn
        FROM Person
    )t
    WHERE rn > 1
)
