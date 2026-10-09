-- 37.	Вывести название предмета, фамилию и имя преподавателя, который ведет этот предмет и среднюю оценку у всех студентов за этот предмет. Оставить только те предметы, которые читаются в первом семестре.


select f.field_id, p.last_name, p.first_name, p.patronymic, round(avg(fc.mark), 2) as "Средний балл"
from fields as f
join field_comprehensions as fc on f.field_id = fc.field
join professors as p on f.professor_id = p.professor_id
where f.semester = 1
group by f.field_id, p.last_name, p.first_name, p.patronymic




--Более лаконичное решение
with avg_mark_per_field as (
    select f.field_id, f.field_name, round(avg(fc.mark), 2) as avg_mark
    from fields as f
    join field_comprehensions as fc on f.field_id = fc.field
    group by f.field_id, f.field_name
)

select f.field_name, p.last_name, p.first_name, p.patronymic, avgm.avg_mark as "Средний балл"
from fields as f
join professors as p on f.professor_id = p.professor_id
join avg_mark_per_field as avgm on f.field_id = avgm.field_id
where f.semester = 1
