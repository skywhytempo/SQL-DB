-- Задача: вывести ФИО всех студентов и их оценки по предметам. Студенты, у которых пока нет оценок, тоже должны попасть в результат.

select s.last_name, s.first_name, s.patronymic, f.field_name, fc.mark
from field_comprehensions fc
right join students s on fc.student_id = s.student_id
join fields f on fc.field = f.field_id
order by s.last_name, s.first_name;