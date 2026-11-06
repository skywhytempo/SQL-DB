-- Создайте триггер, выводящий сообщение об изменении оценок у студентов.
-- Сообщение должно содержать фамилию студента, предмет, старую и новую оценку.

create or replace function notice_mark_change() returns trigger
language plpgsql
AS $$
declare
    student_last_name varchar(30);
    subject_name varchar(100);
begin
    select last_name into student_last_name
    from students
    where student_id = new.student_id;

    select field_name into subject_name
    from fields
    where field_id = new.field;

    raise notice 'Студент: %, предмет: %, старая оценка: %, новая оценка: %',
        student_last_name, subject_name, old.mark, new.mark;

    return new;
end;
$$;

create or replace trigger mark_change_notice
after update of mark on field_comprehensions
for each row
when (old.mark is distinct from new.mark)
execute function notice_mark_change();

select * from field_comprehensions

update field_comprehensions
set mark = 5
where student_id = 847516 and field = 'f81d63d6-ccd0-4cf0-a13a-340c44b852af'

-- Вывод в консоли:
--2026-11-06 16:03:24 [ INFO] Executing: update field_comprehensions set mark = 5 where student_id = 847516 and field = 'f81d63d6-ccd0-4cf0-a13a-340c44b852af'
--2026-11-06 16:03:24 [ INFO] Студент: Блюм, предмет: Иностранный язык, старая оценка: 3, новая оценка: 5
