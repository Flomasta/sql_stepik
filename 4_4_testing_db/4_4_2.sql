INSERT INTO attempt (student_id, subject_id, date_attempt, result)
SELECT student_id, subject_id, NOW() as date_attemp, NULL
FROM attempt
GROUP BY student_id, subject_id
HAVING COUNT(*) < 3
   and MAX(result) < 70;

SELECT *
FROM attempt;
