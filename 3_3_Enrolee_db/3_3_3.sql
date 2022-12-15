SELECT name_subject,
       COUNT(subject_id)     AS Количество,
       MAX(result)           AS Максимум,
       MIN(result)           as Минимум,
       ROUND(AVG(result), 1) as Среднее
FROM subject
         JOIN enrollee_subject USING (subject_id)
GROUP BY name_subject
ORDER BY name_subject;
