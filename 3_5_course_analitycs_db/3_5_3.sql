SELECT CONCAT(module_id, '.', lesson_position, '.', LPAD(step_position, 2, '0'), ' ', step_name) as Шаг
FROM module
         JOIN lesson USING (module_id)
         JOIN step USING (lesson_id)
WHERE step_id in (SELECT step_id
                  FROM step_keyword
                           JOIN keyword USING (keyword_id)
                  WHERE keyword_name in ('MAX', 'AVG')
                  GROUP BY step_id
                  HAVING COUNT(step_id) > 1)
ORDER BY Шаг;
