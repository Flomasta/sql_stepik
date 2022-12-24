WITH main_data (student_name, step, result, attempt_time_result, submission_time, step_id) AS (
    SELECT student_name,
           CONCAT(module_id, '.', lesson_position, '.', step_position),
           result,
           submission_time - attempt_time,
           submission_time,
           step_id

    FROM student
             JOIN step_student USING (student_id)
             JOIN step USING (step_id)
             JOIN lesson USING (lesson_id)
    WHERE student_name = 'student_59'
),
     attempts_order as (
         SELECT step,
                ROW_NUMBER() over (PARTITION BY step_id ORDER BY submission_time) as Номер_попытки,
                submission_time
         FROM main_data
     ),
     avg_time as (
         SELECT ROUND(AVG(attempt_time_result)) FROM main_data WHERE attempt_time_result <= 3600
     ),
     get_fifth_column (Студент, Шаг, Номер_попытки, Результат, Время_попытки, submission_time, step_id)
         as (SELECT student_name            AS Студент,
                    step                    AS Шаг,
                    Номер_попытки,
                    result                  as Результат,
                    IF(ROUND(attempt_time_result / 3600 > 1), (SELECT * FROM avg_time),
                       attempt_time_result) as Время_попытки,
                    submission_time,
                    step_id                    s

             FROM attempts_order
                      JOIN main_data USING (step, submission_time)
     )
SELECT Студент,
       Шаг,
       Номер_попытки,
       Результат,
       SEC_TO_TIME(Время_попытки)                                                 AS Время_попытки,
       ROUND(Время_попытки / sum(Время_попытки) over (partition by Шаг) * 100, 2) as Относительное_время

FROM get_fifth_column
ORDER BY step_id, submission_time;
