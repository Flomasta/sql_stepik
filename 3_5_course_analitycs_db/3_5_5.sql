WITH get_count_correct(step_name_correct, count_correct)
         AS
         (
             SELECT step_name, count(*)
             FROM step
                      JOIN step_student USING (step_id)
             WHERE result = 'correct'
             GROUP BY step_name
         ),
     get_count_wrong (step_name_wrong, count_wrong)
         AS (
         SELECT step_name, count(*)
         FROM step
                  JOIN step_student USING (step_id)
         WHERE result = 'wrong'
         GROUP BY step_name
     )
SELECT step_name_correct                                              as Шаг,
       IF(ROUND(count_correct / (count_correct + count_wrong) * 100) IS NULL, 100,
          ROUND(count_correct / (count_correct + count_wrong) * 100)) as Успешность
FROM get_count_correct
         LEFT JOIN get_count_wrong ON step_name_correct = step_name_wrong
UNION
SELECT step_name_wrong as Шаг,
       IF(ROUND(count_correct / (count_correct + count_wrong) * 100) IS NULL, 0,
          ROUND(count_correct / (count_correct + count_wrong) * 100))
FROM get_count_correct
         RIGHT JOIN get_count_wrong ON step_name_correct = step_name_wrong
ORDER BY 2, 1
