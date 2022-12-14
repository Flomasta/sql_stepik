SELECT name_student, date_attempt, result
FROM subject
         JOIN attempt USING (subject_id)
         JOIN student USING (student_id)
WHERE name_subject = 'Основы баз данных'
ORDER BY result DESC;
