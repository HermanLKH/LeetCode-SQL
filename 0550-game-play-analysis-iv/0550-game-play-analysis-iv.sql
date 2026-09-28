/* Write your T-SQL query statement below */
WITH CTE_First_Logins AS
(
    SELECT
        player_id,
        MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id
)
SELECT
    ROUND(
        AVG(
            CASE
                WHEN a.event_date IS NOT NULL
                    THEN 1.0
                ELSE 0
            END
        ), 
    2) AS fraction
FROM CTE_First_Logins cfl
LEFT JOIN Activity a
ON
    cfl.player_id = a.player_id AND
    a.event_date = DATEADD(DAY, 1, cfl.first_login_date)