-- Задача: вывести единый список преподавателей и студентов определённого подразделения.

select p.last_name, p.first_name, p.patronymic, 'Преподаватель' as role, su.full_title
from professors as p
join employments as e on p.professor_id = e.professor_id
join structural_units as su on e.structural_unit_id = su.structural_unit_id

union all

select s.last_name, s.first_name, s.patronymic, 'Студент' as role, su.full_title
from students as s
join students_groups as sg on s.students_group_number = sg.students_group_number
join structural_units as su on sg.structural_unit_id = su.structural_unit_id






