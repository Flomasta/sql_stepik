WITH table_1 (student_id, step_id, step_time) AS (
    SELECT student_id, step_id, SUM(submission_time - attempt_time)
    FROM step_student
    WHERE submission_time - attempt_time
              < 14440
    GROUP BY student_id, step_id
),
     table_2(student_id, lesson_id, lesson_time) AS (
         SELECT student_id,
                lesson_id,
                SUM(step_time / 3600) as lesson_time
         FROM table_1
                  JOIN step USING (step_id)

         GROUP BY student_id, lesson_id)
SELECT RANK() OVER (ORDER BY ROUND(AVG(lesson_time), 2) )        as Номер,
       CONCAT(module_id, '.', lesson_position, ' ', lesson_name) as Урок,
       ROUND(AVG(lesson_time), 2)                                as Среднее_время
FROM table_2
         JOIN lesson USING (lesson_id)
GROUP BY lesson_id;
