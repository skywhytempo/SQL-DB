-- Подсчитать количество различных отчеств у девушек студенток,
-- вывести только те записи, где количество отчеств > 1
-- и отсортировать их в порядке возрастания количества

select patronymic as patronymic, count(*) as count
from students
where patronymic like '%вна'
group by patronymic
having count(*) > 1
order by count asc;

-- потом