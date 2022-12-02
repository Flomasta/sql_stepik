CREATE TABLE back_payment as
SELECT name, number_plate, violation, sum_fine, date_violation
FROM fine
WHERE date_payment IS NULL;
