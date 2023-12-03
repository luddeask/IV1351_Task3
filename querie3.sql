-- Common Table Expression (CTE) to calculate the number of lessons for each instructor in the current month
WITH InstructorLessonCount AS (
    SELECT
        i.instructor_id,
        p.first_name,
        p.last_name,
        COUNT(*) AS LessonCount
    FROM
        instructor i
        JOIN lesson l ON i.instructor_id = l.instructor_id
        JOIN person p ON i.instructor_id = p.person_id
    WHERE
        EXTRACT(MONTH FROM l.start_time) = EXTRACT(MONTH FROM CURRENT_DATE) -- Filter by the current month
    GROUP BY
        i.instructor_id, p.first_name, p.last_name
)

-- Main query to select and filter the results from the CTE
SELECT
    ilc.instructor_id AS "Instructor Id",
    ilc.first_name AS "First Name",
    ilc.last_name AS "Last Name",
    ilc.LessonCount AS "No of Lessons"
FROM
    InstructorLessonCount ilc
WHERE
    ilc.LessonCount > 0 -- Specify the specific number of lessons as the threshold
ORDER BY
    ilc.LessonCount DESC; -- Order the results by the number of lessons in descending order