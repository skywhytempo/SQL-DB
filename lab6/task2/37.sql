-- Создайте функцию, возвращающую фамилию случайного студента

create or replace function random_student_last_name() returns varchar(30)
language SQL
AS $$
    select last_name
    from students
    order by random()
    limit 1;
$$;

-- Проверка
select random_student_last_name();
