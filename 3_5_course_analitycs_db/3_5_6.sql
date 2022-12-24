SET @all_steps := (SELECT count(DISTINCT step_id)
                   from step_student);

WITH all_students_result (Студент, Прогресс) AS
         (SELECT student_name,
                 ROUND((count(distinct step_id) /
                        @all_steps * 100))
          FROM step_student
                   JOIN student USING (student_id)
          where result = 'correct'
          group by student_id)
SELECT Студент,
       Прогресс,
       CASE
           WHEN Прогресс = 100 THEN 'Сертификат с отличием'
           WHEN Прогресс >= 80 THEN 'Сертификат'
           ELSE ''
           END as Результат
FROM all_students_result
ORDER BY Прогресс DESC, Студент;
