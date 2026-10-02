select last_name, first_name, patronymic, students_group_number,
       age(CURRENT_DATE, birthday),
       row_number() over(
            partition by students_group_number
            order by birthday desc
           )
from students