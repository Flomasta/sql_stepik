SELECT name_department,
       name_program,
       plan,
       COUNT(program_id)                  AS Количество,
       ROUND(COUNT(program_id) / plan, 2) AS Конкурс
FROM department
         JOIN program USING (department_id)
         JOIN program_enrollee USING (program_id)
GROUP BY name_department, name_program, plan
ORDER BY Конкурс DESC;
