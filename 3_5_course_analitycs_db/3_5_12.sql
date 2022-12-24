WITH group_one AS (SELECT student_name                                                                    as Студент,
                          step_id,
                          result,
                          LEAD(result) OVER (PARTITION BY student_name, step_id order by submission_time) as nxt

                   FROM student
                            JOIN step_student USING (student_id)),
     group_two AS (SELECT student_name as Студент,
                          student_id
                                          step_id
                   FROM student
                            JOIN step_student USING (student_id)
                   WHERE result = 'correct'
                   GROUP BY student_id, step_id
                   HAVING COUNT(*) > 1
     )
        ,
     group_three AS (
         SELECT step_id, student_name as Студент
         FROM student
                  JOIN step_student USING (student_id)
         GROUP BY step_id, student_name
         HAVING SUM(CASE WHEN result = 'wrong' THEN 1 ELSE 0 END) = COUNT(*))


SELECT 'I' as Группа, Студент, COUNT(step_id) AS Количество_шагов
FROM group_one
WHERE result = 'correct'
  and nxt = 'wrong'
GROUP BY Студент
UNION

SELECT 'II' as Группа, Студент, COUNT(step_id) AS Количество_шагов
FROM group_two
GROUP BY Студент
UNION
SELECT 'III' as Группа, Студент, COUNT(step_id) AS Количество_шагов
FROM group_three
GROUP BY Студент
ORDER BY 1, 3 DESC, 2
