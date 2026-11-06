-- Появилась ставка доцента. Переведите старшего преподавателя имеющего наибольший стаж на должность доцента.

with max_experience as (
    select professor_id
    from professors
    where current_position = 'старший преподаватель'
    order by experience desc
    limit 1
)

update professors
set current_position = 'доцент'
where professor_id = (select professor_id from max_experience);

