
-- Вывести всех студентов ИБ с именем Андрей
select *
from  students
where students_group_number like 'ИБ-%'
and first_name = 'Андрей'