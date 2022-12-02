SELECT name, city, date_first, ((DATEDIFF(date_last, date_first) + 1)) * per_diem AS 'Сумма'
FROM trip
WHERE MONTHNAME(date_first) IN ('March', 'February')
  AND YEAR(date_first) = '2020'
ORDER BY name, Сумма DESC;
