select student_id, round(avg(mark), 2)
from field_comprehensions
where student_id = 847516
group by student_id