
-- Найти среднюю оценку каждого студента по всем дисциплинам,
-- отсортировать записи по оценке и дисциплине,
-- оставив только тех, у кого средняя оценка больше 4

select student_id as "student_id", avg(mark) as "Средняя оценка"
from field_comprehensions
group by student_id
having avg(mark) > 4;

-- Можно еще побаловаться с join:

select last_name as "Фамилия", first_name as "Имя",
       students_group_number as "Группа", avg(mark) as "Средняя оценка"
from field_comprehensions as fc
join students as s
    on fc.student_id = s.student_id
group by
    s.student_id, s.last_name, s.first_name, s.students_group_number
having avg(mark) > 4;



select *
from field_comprehensions as fc
join students as s
    on fc.student_id = s.student_id