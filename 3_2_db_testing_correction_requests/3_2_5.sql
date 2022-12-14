INSERT INTO student(name_student)
VALUES ('flomasta');

INSERT INTO attempt (student_id, subject_id, date_attempt, result)
SELECT query_table.student_id, subject_id, DATE_ADD(NOW(), interval rand() * -10 DAY), 100
FROM (SELECT student_id, subject_id
      FROM student
               CROSS JOIN subject
      WHERE student_id = (SELECT student_id FROM student WHERE name_student = 'flomasta')) as query_table
;


SELECT *
FROM student;
SELECT name_student, name_subject, date_attempt, result
FROM student
         JOIN attempt USING (student_id)
         JOIN subject USING (subject_id)
ORDER BY date_attempt;
SELECT *
FROM attempt;
