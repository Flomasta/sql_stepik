SELECT name_subject,
       CONCAT(LEFT(name_question, 30), '...')                 AS Вопрос,
       COUNT(t.answer_id)                                     AS Всего_ответов,
       ROUND((SUM(is_correct) / COUNT(t.answer_id)) * 100, 2) AS Успешность

FROM subject
         JOIN question USING (subject_id)
         JOIN testing t USING (question_id)
         LEFT JOIN answer a USING (answer_id)
GROUP BY name_subject, CONCAT(LEFT(name_question, 30), '...')
ORDER BY name_subject, Успешность DESC, Вопрос
