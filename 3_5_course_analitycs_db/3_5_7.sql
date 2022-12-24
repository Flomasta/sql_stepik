WITH query_set(Студент, Шаг, Результат, submission_time, submission_time_prev) AS (
    SELECT student_name                       as Студент,
           CONCAT(LEFT(step_name, 20), '...') as Шаг,
           result                             as Результат,
           submission_time,
           LAG(submission_time, 1, submission_time) OVER (ORDER BY submission_time)
    FROM step
             JOIN step_student USING (step_id)
             JOIN student USING (student_id)
    WHERE student_name = 'student_61'
)
SELECT Студент,
       Шаг,
       Результат,
       FROM_UNIXTIME(submission_time)                      as Дата_отправки,
       SEC_TO_TIME(submission_time - submission_time_prev) as Разница
FROM query_set
ORDER BY Дата_отправки;

/*
LAG(submission_time,1,submission_time)
первый аргумент - LAG(submission_time) - предыдущая сабмишн
второй аргумент - 1 - через сколько строк брать предыдущее значение
третий аргумент - submission_time - Если вычисленное значение Null, то взять текущее значение сабмишн
*/
