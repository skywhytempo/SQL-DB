-- 17.	Вывести ФИО всех студентов и форму их обучения.  Включить в список только заочников.


select s.last_name, s.first_name, s.patronymic, sg.enrolment_status
from students as s
join students_groups as sg on s.students_group_number = sg.students_group_number and sg.enrolment_status = 'Заочная'