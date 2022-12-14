INSERT INTO attempt (student_id, subject_id, date_attempt, result)
SELECT (SELECT student_id FROM student WHERE name = ' Баранов Павел'),
       (SELECT subject_id FROM subject WHERE name_subject = 'Основы баз данных'),
       NOW(),
       NULL;

SELECT *
FROM attempt
