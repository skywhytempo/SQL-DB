-- 7. Вывести название структурного подразделения, номер трудового договора и ФИО преподавателя, который трудоустроен в этом структурном подразделении. Отсортировать по названию структурного подразделения и фамилии и имени преподавателя.

select su.full_title as "Название подразделения", e.contract_number as "Номер договора", p.last_name, p.first_name, p.patronymic
from structural_units as su
join employments as e on su.structural_unit_id = e.structural_unit_id
join professors as p on e.professor_id = p.professor_id
order by "Название подразделения", p.last_name, p.first_name