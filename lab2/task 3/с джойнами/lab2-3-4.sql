-- Хочу увидеть для каждого структурного подразделения список преподавателей
-- с их окладом (salary) и должностью (current_position),
-- но только трёх преподавателей с самым высоким окладом в рамках каждого подразделения.
-- Для этого нужна оконная функция ROW_NUMBER() (или RANK()),
-- которая пронумерует преподавателей внутри PARTITION BY structural_unit_id
-- (через employments) по убыванию salary,
-- а затем внешний запрос отбирает только строки с номером ≤ 3.

-- это все, разбитые по факультетам, без
select p.last_name, p.first_name, su.full_title, p.salary,
       row_number() over (
           partition by su.structural_unit_id
           order by p.salary desc
           )
from structural_units as su
join employments as e on e.structural_unit_id = su.structural_unit_id
join professors as p on p.professor_id = e.professor_id;

-- с подзапросом

select *
from (
         select p.last_name, p.first_name, p.salary, su.structural_unit_id, su.full_title,
                row_number() over (partition by su.structural_unit_id order by p.salary desc) as rn
         from professors p
                  join employments e on e.professor_id = p.professor_id
                  join structural_units su on su.structural_unit_id = e.structural_unit_id
     ) as ranked
where rn <= 3
order by structural_unit_id, salary desc;

