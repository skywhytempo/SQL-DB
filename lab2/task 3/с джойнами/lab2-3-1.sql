-- Хочу увидеть среднюю оценку по каждому направлению (field_name)
-- на основе field_comprehensions, но только для тех направлений,
-- где сдавало больше 5 студентов, отсортировать по убыванию средней оценки,
-- округлить до сотых.

select  f.field_name, avg(fc.mark)::numeric(10,2)
from field_comprehensions as fc
join fields as f on f.field_id = fc.field
group by f.field_name
having count(distinct fc.student_id) > 5
order by avg(fc.mark) desc

