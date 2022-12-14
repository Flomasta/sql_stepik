SELECT name_subject,
       COUNT(attempt.subject_id) as Количество,
       ROUND(AVG(result), 2)     as Среднее
FROM subject
         LEFT JOIN attempt USING (subject_id)
GROUP BY name_subject
