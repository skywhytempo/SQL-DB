select su.full_title as "Название подразделения", e.contract_number as "Номер договора", p.last_name, p.first_name, p.patronymic
from structural_units as su
join employments as e on su.structural_unit_id = e.structural_unit_id
join professors as p on e.professor_id = p.professor_id