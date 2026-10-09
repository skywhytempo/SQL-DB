-- 77.	Вывести фамилию, имя, группу и возраст студента, у которого возраст меньше среднего по всем студентам.

with avg_age as (
    select date_part('year', avg(age(birthday))) as age
    from students
)

select last_name, first_name, patronymic, students_group_number, date_part('year', age(birthday)) as age
from students
where date_part('year', age(birthday)) < (select age from avg_age)