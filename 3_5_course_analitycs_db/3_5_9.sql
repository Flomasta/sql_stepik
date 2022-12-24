WITH table_result (module_id, student_name, steps) AS (
    SELECT module_id,
           student_name,
           COUNT(DISTINCT step_id)

    FROM student
             JOIN step_student USING (student_id)
             JOIN step USING (step_id)
             JOIN lesson USING (lesson_id)
             JOIN module USING (module_id)
    WHERE result = 'correct'
    GROUP BY module_id, student_name
)
SELECT module_id                                                          as Модуль,
       student_name                                                       as Студент,
       steps                                                              as Пройдено_шагов,
       ROUND((steps / MAX(steps) OVER (PARTITION BY module_id) * 100), 1) as Относительный_рейтинг
FROM table_result
ORDER BY Модуль, Относительный_рейтинг DESC, Студент;
