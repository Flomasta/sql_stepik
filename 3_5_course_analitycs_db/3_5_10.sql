WITH unique_lessons AS (SELECT student_name
                             , CONCAT(module_id, '.', lesson_position) as lesson
                             , MAX(submission_time)                    as max_time
                        FROM student
                                 JOIN step_student USING (student_id)
                                 JOIN step USING (step_id)
                                 JOIN lesson USING (lesson_id)
                        WHERE result = 'correct'
                        GROUP BY student_name, lesson
),
     three_lesson_student AS (
         SELECT student_name
         FROM unique_lessons
         GROUP BY student_name
         HAVING COUNT(*) = 3
     )
SELECT student_name            as Студент,
       lesson                  as Урок,
       FROM_UNIXTIME(max_time) as Макс_время_отправки,
       IFNULL(CEIL(((max_time - LAG(max_time) OVER (PARTITION BY student_name ORDER BY max_time)) / 3600) / 24),
              '-')             as Интервал
FROM unique_lessons
         JOIN three_lesson_student USING (student_name)
ORDER BY Студент, Макс_время_отправки;
