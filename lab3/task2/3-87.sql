-- 87.	Выведите все дисциплины семестра, в котором читаются наибольшее количество дисциплин.

with max_sem as (
    select semester, count(field_id) as field_count
    from fields
    group by semester
    order by "field_count" desc
    limit 1

)
select field_name, semester from fields
where semester = (select semester from max_sem)
