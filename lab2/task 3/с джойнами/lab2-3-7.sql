-- Хочу увидеть студентов, у которых expiration_date из student_ids уже прошёл
-- (то есть билет просрочен на сегодняшнюю дату), вывести ФИО, номер группы,
-- дату выдачи и сколько дней прошло с момента истечения срока (через разницу дат),
-- отсортировать по количеству просроченных дней в порядке убывания.


select s.last_name, s.first_name, s.students_group_number,
       issue_date, expiration_date, age(current_date, expiration_date)
from students as s
join student_ids as si on si.student_id = s.student_id
where si.expiration_date < current_date
order by age(current_date, expiration_date) desc