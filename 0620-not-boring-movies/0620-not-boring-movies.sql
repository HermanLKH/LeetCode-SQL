/* Write your T-SQL query statement below */
SELECT
    id,
    movie,
    description,
    rating
FROM Cinema
WHERE
    TRIM(description) <> 'boring' AND
    id % 2 <> 0
ORDER BY rating DESC