-- Создайте процедуру изменения почты у студента. 

create or replace procedure update_email(e_student_id integer, new_email varchar)
language SQL
AS $$
    update students
    set email = new_email
    where student_id = e_student_id;
$$;

select *
from students
where student_id = 863396;
--order by random() limit 1;

call update_email(863396, 'new_email@miet.ru')

-- скриптом
DO
$$
DECLARE
    rand_student record;
    new_student_email varchar := 'new_3student_email@miet.ru';
BEGIN
    select * into rand_student
    from students
    order by random() limit 1;
    raise notice 'Выбранный для процедуры студент: % %. Почта: %',
    rand_student.last_name, rand_student.first_name, rand_student.email;

    call update_email(rand_student.student_id, new_student_email);
    select * into rand_student
    from students
    where student_id = rand_student.student_id;
    
    raise notice 'Обновлённые данные студента % %. Почта: %',
    rand_student.last_name, rand_student.first_name, rand_student.email;
end;
$$LANGUAGE plpgsql


-- 2026-11-06 16:13:41 [ INFO] Выбранный для процедуры студент: Юсов Аким. Почта: JusovAkim@miet.ru
--2026-11-06 16:13:41 [ INFO] Обновлённые данные студента Юсов Аким. Почта: new_3student_email@miet.ru
--2026-11-06 16:13:41 [ INFO] Result: Completed in 11ms