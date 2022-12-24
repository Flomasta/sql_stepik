SELECT CONCAT(module_id, ' ', LEFT(module_name, 14), '...')                               as Модуль,
       CONCAT(module_id, '.', lesson_position, ' ', CONCAT(LEFT(lesson_name, 12), '...')) as Урок,
       CONCAT(module_id, '.', lesson_position, '.', step_position, ' ', step_name)        as Шаг
FROM module
         JOIN lesson USING (module_id)
         JOIN step USING (lesson_id)
WHERE step_name LIKE '%ложенн%'
ORDER BY Модуль, Урок, Шаг;
