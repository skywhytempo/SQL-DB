-- 47.	Вывести все пары фамилий преподавателей, у которых одинаковые имена   

select p1.professor_id, p1.last_name as "Первая фамилия", p2.professor_id, p2.last_name as "Вторая фамилия", p1.first_name
from professors as p1
left join professors as p2 on p1.first_name = p2.first_name and p1.professor_id < p2.professor_id 
order by p1.first_name