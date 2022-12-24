SELECT author, SUM(price * amount) as Стоимость
from book
group by author
HAVING AVG(price)
ORDER BY 2 DESC;
