DELETE
FROM author
WHERE author_id in (SELECT author_id FROM book GROUP BY author_id HAVING sum(amount) < 20);

SELECT *
FROM author;
SELECT *
from book;
