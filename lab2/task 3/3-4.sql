select last_name, first_name, students_group_number
from students
where first_name like (
    select first_name
    from students
    group by first_name
    order by count(first_name) desc
    limit 1
    )