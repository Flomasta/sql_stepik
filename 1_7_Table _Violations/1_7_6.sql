UPDATE fine, payment
SET fine.date_payment = payment.date_payment,
    fine.sum_fine     = IF(DATEDIFF(payment.date_payment, payment.date_violation) < 20, fine.sum_fine / 2,
                           fine.sum_fine)
WHERE payment.name = fine.name
  AND payment.number_plate = fine.number_plate
  AND payment.violation = fine.violation
  AND fine.date_violation IS NULL;
