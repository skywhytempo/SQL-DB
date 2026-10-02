-- Число дисциплин в семестре

select semester, count(semester)
from fields
group by semester
having count(semester) >= 20
order by semester