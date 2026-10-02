
-- 77.	Вывести пять самых популярных отчеств у студентов и их количество,
-- Значение null в подсчёт не включать.

select patronymic, COUNT(*) as "Количество"
from students
where patronymic not like 'null'
group by patronymic
order by "Количество" desc
limit 5;
