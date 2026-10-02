-- Выбрать всех студентов моложе 20 лет

select last_name, first_name, students_group_number
from students
where date_part('year', age(CURRENT_DATE, birthday)) < 21
order by birthday desc

--age - cчитает интервал между текущей датой и днём рождения
--date_part - при помощи years берет из этого интервала только год