INSERT INTO step_keyword (step_id, keyword_id)
SELECT step_id, keyword_id
FROM keyword
         CROSS JOIN step
WHERE REGEXP_INSTR(step_name, CONCAT('\\b', keyword_name, '\\b'));


SELECT *
FROM step_keyword;
