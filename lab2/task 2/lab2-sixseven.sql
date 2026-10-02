
-- 67. Выведите количество студентов девушек, которые обучаются на третьем курсе.

select count(*)
from students
where patronymic like '%вна' and students_group_number like '%-3_'

