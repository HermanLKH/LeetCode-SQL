/* Write your T-SQL query statement below */
SELECT
    name AS results
FROM Users
WHERE user_id = 
(
    SELECT TOP(1)
        u.user_id
    FROM Users u
    INNER JOIN MovieRating mr
    ON mr.user_id = u.user_id
    GROUP BY u.user_id, name
    ORDER BY COUNT(mr.rating) DESC, name
)

UNION ALL

SELECT
    title AS results
FROM Movies
WHERE movie_id = 
(
    SELECT TOP(1)
        m.movie_id
    FROM MovieRating mr
    INNER JOIN Movies m
    ON m.movie_id = mr.movie_id
    WHERE MONTH(mr.created_at) = 2
    AND YEAR(mr.created_at) = 2020
    GROUP BY m.movie_id, m.title
    ORDER BY AVG(CAST(mr.rating AS FLOAT)) DESC, m.title
)
