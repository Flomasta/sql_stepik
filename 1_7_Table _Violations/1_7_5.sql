UPDATE fine,
    (
        SELECT name, number_plate, violation
        from fine
        GROUP BY name, number_plate, violation
        HAVING count(*) > 1
    ) query_in
SET sum_fine = sum_fine * 2
WHERE fine.violation = query_in.violation
  and fine.name = query_in.name
  and fine.number_plate = query_in.number_plate
  and date_payment is NULL;
