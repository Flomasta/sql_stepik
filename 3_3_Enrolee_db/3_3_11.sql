SELECT LOWER(name_subject) as предмет,
       MIN(result)         as минимум,
       MAX(result)         as максимум,
       ROUND(AVG(result))  as среднее,
       COUNT(*)            as Количество
FROM enrollee_subject
         JOIN subject USING (subject_id)
GROUP by name_subject
ORDER BY среднее DESC;
