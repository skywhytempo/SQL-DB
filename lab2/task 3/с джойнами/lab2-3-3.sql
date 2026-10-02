-- Хочу увидеть список студентов (ФИО, номер группы),
-- у которых в field_comprehensions есть оценка,
-- соответствующая "неудовлетворительно"
-- (аналог задания №19 из методички, но у тебя это будет через CASE или конкретное значение mark),
-- отсортировать по фамилии.

select distinct st.last_name, st.first_name, st.patronymic--, f.field_name
from students as st
join field_comprehensions as fc on st.student_id = fc.student_id
--join fields as f on fc.field = f.field_id
where fc.mark = 2
order by  st.last_name

