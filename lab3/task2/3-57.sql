-- 57.	Выведите фамилии всех преподавателей и их зарплату. В первой строчке вывести: ‘Средняя зарплата' (можно начать с латинской буквы “C” ) и значение средней зарплаты у преподавателей.

select 'Средняя зарплата' as last_name, round(avg(salary), 2) as salary
from professors

union all

select last_name, salary
from professors