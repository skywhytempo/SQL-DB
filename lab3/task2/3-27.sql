-- 27.	Вывести названия первых групп (включая вечерников) и названия их структурных подразделений.

select sg.students_group_number, su.full_title as "Название подразделения"
from students_groups as sg
join structural_units as su on sg.structural_unit_id = su.structural_unit_id and sg.students_group_number like '%-_1%'
