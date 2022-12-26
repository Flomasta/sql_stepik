WITH main_table as (
    SELECT name_subject,
           name_question,
           ROUND((SUM(is_correct) / COUNT(answer_id)) * 100, 2) AS Успешность

    FROM subject
             JOIN question USING (subject_id)
             JOIN testing USING (question_id)
             LEFT JOIN answer a USING (answer_id)
    GROUP BY name_subject, name_question)
SELECT name_subject, name_question, 'самый легкий' as Сложность
FROM main_table
WHERE Успешность = (SELECT MAX(Успешность) from main_table)
UNION
SELECT name_subject, name_question, 'самый сложный' as Сложность
FROM main_table
WHERE Успешность = (SELECT MIN(Успешность) from main_table)
;
