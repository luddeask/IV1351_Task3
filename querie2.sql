-- This query calculates the number of students who have siblings and groups them by the number of siblings they have.
WITH SiblingCount AS (
    -- This subquery counts the number of siblings each student has.
    SELECT
        student_id,
        COUNT(*) AS num_siblings
    FROM
        sibling_relation
    GROUP BY
        student_id
)

SELECT
    -- This column displays the number of siblings each student has. If a student has no siblings, the value is 0.
    COALESCE(sc.num_siblings, 0) AS "No of Siblings",
    -- This column displays the number of students in each group.
    COUNT(*) AS "No of Students"
FROM
    student
    -- This join ensures that all students are included in the result set, even if they have no siblings.
    LEFT JOIN SiblingCount sc ON student.student_id = sc.student_id
GROUP BY
    -- This groups the students by the number of siblings they have. If a student has no siblings, they are grouped with the students who have 0 siblings.
    COALESCE(sc.num_siblings, 0)
ORDER BY
    -- This orders the result set by the number of siblings each student has.
    "No of Siblings";