-- Хочу увидеть все направления (fields),
-- название которых начинается на определённую букву
-- или содержит конкретное подслово (аналог заданий 41–50 из методички на регулярки),
-- вместе с названием структурного подразделения,
-- к которому они относятся, отсортировать по семестру.

select distinct f.field_name, su.full_title, semester
from fields as f
join structural_units as su on f.structural_unit_id = su.structural_unit_id
where field_name like 'Основы%'
order by semester