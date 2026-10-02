select mark, count(mark)
from field_comprehensions
where mark is not null
group by mark
order by mark