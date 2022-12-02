SELECT name, city, date_first, date_last
from trip
WHERE MONTH(date_first) = MONTH(date_last)
ORDER BY city, name;
