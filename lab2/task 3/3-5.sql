select last_name, first_name, current_position, salary,
       case when salary::numeric(10, 2) < 90000.00 then 'Низкий'
            when salary::numeric(10, 2) < 150000.00 then 'Средний'
            when salary::numeric(10, 2) >= 150000.00 then 'Высокий'
end
from professors
order by salary