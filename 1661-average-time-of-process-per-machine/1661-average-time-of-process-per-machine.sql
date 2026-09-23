/* Write your T-SQL query statement below */
SELECT
    machine_id,
    ROUND(AVG(duration), 3) AS processing_time
FROM
(
    SELECT
        machine_id,
        activity_type,
        LAG(timestamp) OVER(PARTITION BY machine_id, process_id ORDER BY timestamp) prevTime,
        timestamp,
        CASE
            WHEN activity_type = 'end' THEN timestamp - LAG(timestamp) OVER(PARTITION BY machine_id, process_id ORDER BY timestamp)
            ELSE NULL
        END AS duration
    FROM Activity
)t
WHERE duration IS NOT NULL
GROUP BY machine_id