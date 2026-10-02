select degree, count(degree)
from professors
where degree is not null
group by degree
having count(degree) > 2
order by count(degree) desc
