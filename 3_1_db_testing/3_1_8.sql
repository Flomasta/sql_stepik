SELECT name_student, name_subject, date_attempt, ROUND((SUM(is_correct) / 3) * 100, 2) as Результат
FROM answer
         JOIN testing USING (answer_id)
         JOIN attempt USING (attempt_id)
         JOIN student USING (student_id)
         JOIN subject USING (subject_id)
GROUP BY name_student, name_subject, date_attempt
ORDER BY name_student, date_attempt DESC;
