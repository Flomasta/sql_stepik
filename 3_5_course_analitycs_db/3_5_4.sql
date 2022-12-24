SELECT CASE
           WHEN rate <= 10 THEN 'I'
           WHEN rate <= 15 THEN 'II'
           WHEN rate <= 27 THEN 'III'
           ELSE 'IV'
           END  as Группа,
       CASE
           WHEN rate <= 10 THEN 'от 0 до 10'
           WHEN rate <= 15 THEN 'от 11 до 15'
           WHEN rate <= 27 THEN 'от 16 до 27'
           ELSE 'больше 27'
           END  AS Интервал,
       count(*) AS Количество
FROM (SELECT student_name, count(*) as rate
      FROM step_student
               JOIN student USING (student_id)
      WHERE result = 'correct'
      GROUP BY student_name
     ) as query
GROUP BY Группа, Интервал
ORDER BY Группа;
