SELECT name_student                                                                             AS Студент,
       IF(AVG(result) > 50, 'Повысить стипендию на 100 рублей ', 'Отчислить за неуспеваемость') AS Решение_Ректората
FROM student
         LEFT JOIN attempt USING (student_id)
WHERE result = 100 AND subject_id IN (1, 2)
   OR result IS NULL
GROUP BY name_student;
