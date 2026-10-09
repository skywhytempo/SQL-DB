-- 67. Вывести ФИО всех мужчин в институте (среди преподавателей и студентов). Учесть очень большое, в отличии от женщин, разнообразие окончаний фамилий и частое отсутствие отчеств.  Добавить столбец, в котором обозначить преподаватель это или студент. 

select last_name, first_name, patronymic, 'Преподаватель' AS person_type
from professors
where lower(trim(coalesce(patronymic, ''))) not like '%на'
and lower(trim(last_name)) not like '%а'

union all

select last_name, first_name, patronymic, 'Студент' AS person_type
from students
where lower(trim(coalesce(patronymic, ''))) not like '%на'
and lower(trim(last_name)) not like '%а''

ORDER BY last_name, first_name;