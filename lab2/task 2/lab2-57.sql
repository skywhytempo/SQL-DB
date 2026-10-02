
-- Была потеряна контрольная работа студента с инициалами В.Ф.
-- Необходимо определить фамилию, группу, в которой обучается студент и вернуть работу.

select last_name, students_group_number
from students
where first_name like 'В%'
and patronymic like 'Ф%'