-- Selecting the abbreviated month name, total count, and counts for each lesson type
SELECT
    TO_CHAR(start_time, 'Mon') AS Month, -- Extract abbreviated month name
    COUNT(*) AS Total, -- Total number of lessons
    SUM(CASE WHEN lt.value = 'Private' THEN 1 ELSE 0 END) AS Individual, -- Count of Private lessons
    SUM(CASE WHEN lt.value = 'Group' THEN 1 ELSE 0 END) AS Group, -- Count of Group lessons
    SUM(CASE WHEN lt.value = 'Ensemble' THEN 1 ELSE 0 END) AS Ensemble -- Count of Ensemble lessons
FROM
    lesson l
    JOIN lesson_type lt ON l.lesson_type_id = lt.lesson_type_id -- Joining the lesson and lesson_type tables
WHERE
    EXTRACT(YEAR FROM l.start_time) = 2023 -- Filtering lessons for the specified year
GROUP BY
    TO_CHAR(l.start_time, 'Mon') -- Grouping results by month
ORDER BY
    TO_CHAR(MIN(l.start_time), 'MM'); -- Ordering the results by the earliest month in the year