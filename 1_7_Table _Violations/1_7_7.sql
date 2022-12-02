UPDATE fine f , payment p
SET f.date_payment = p.date_payment,
    f.sum_fine     = IF(DATEDIFF(p.date_payment, p.date_violation) < 21, ROUND(f.sum_fine / 2, 2),
                           f.sum_fine)
WHERE (f.name, f.number_plate, f.violation) = (p.name, p.number_plate, p.violation)
  AND f.date_payment IS NULL;
