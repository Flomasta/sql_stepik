SELECT MONTHNAME(date_first) AS 'Месяц', COUNT(MONTHNAME(date_first)) AS 'Количество'
from trip
GROUP BY MONTHNAME(date_first)
ORDER BY Количество DESC, Месяц;
