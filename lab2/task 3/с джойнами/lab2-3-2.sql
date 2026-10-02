-- Хочу увидеть, сколько преподавателей
-- в каждом структурном подразделении (structural_units)
-- через employments, и суммарную ставку (wage_rate)
-- по каждому подразделению — оставить только те,
-- где суммарная ставка больше 1.0, отсортировать по убыванию.

select su.structural_unit_id, su.full_title,
       count(distinct e.professor_id) as prof_count,
       sum(e.wage_rate) as wage_sum
from structural_units su
join employments e on su.structural_unit_id = e.structural_unit_id
group by su.structural_unit_id, su.full_title
having sum(e.wage_rate) > 1
order by sum(e.wage_rate) desc