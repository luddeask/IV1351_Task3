-- Common Table Expression (CTE) to calculate ensemble availability based on the specified date range
WITH EnsembleAvailability AS (
    SELECT
        TO_CHAR(l.start_time, 'Dy') AS Day,
        gt.value AS Genre,
        CASE
            WHEN l.max_of_students - COUNT(lb.student_id) = 0 THEN 'Fully Booked'
            WHEN l.max_of_students - COUNT(lb.student_id) BETWEEN 1 AND 2 THEN '1 or 2 Seats Left'
            ELSE 'Many Seats'
        END AS "Availability Status"
    FROM
        lesson l
        JOIN lesson_type lt ON l.lesson_type_id = lt.lesson_type_id
        JOIN genre_type gt ON lt.genre_type_id = gt.genre_type_id
        LEFT JOIN lesson_booking lb ON l.lesson_id = lb.lesson_id
    WHERE
        DATE(l.start_time) BETWEEN CURRENT_DATE AND (CURRENT_DATE + INTERVAL '7 days') -- Filter by the next week
        AND lt.value = 'Ensemble' -- Only include lessons with a lesson type of 'Ensemble'
    GROUP BY
        TO_CHAR(l.start_time, 'Dy'), gt.value, l.max_of_students
)

-- Main query to select and display the results from the CTE
SELECT
    ea.Day,
    ea.Genre,
    ea."Availability Status" AS "No of Free Seats"
FROM
    EnsembleAvailability ea
ORDER BY
    ea.Day, ea.Genre;
