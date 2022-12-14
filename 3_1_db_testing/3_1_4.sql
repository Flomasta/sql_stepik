SELECT name_student, name_subject, DATEDIFF(MAX(date_attempt), MIN(date_attempt)) as Интервал
FROM subject
         JOIN attempt USING (subject_id)
         JOIN student USING (student_id)
GROUP BY name_student, name_subject
HAVING COUNT(attempt_id) > 1
ORDER BY Интервал;
