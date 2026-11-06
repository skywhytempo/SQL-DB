-- Создать триггер, который при выставлении пятой и более двойки удаляет студента из базы.
-- Запись об удалении заносится в информационную таблицу.

create table if not exists deleted_students (
    student_id integer,
    last_name varchar(30),
    first_name varchar(30),
    deleted_at timestamp default current_timestamp,
    reason text
);

create or replace function delete_student_for_fives() returns trigger
language plpgsql
AS $$
declare
    twos_count integer;
    stud record;
begin
    if new.mark = 2 then
        select count(*) into twos_count
        from field_comprehensions
        where student_id = new.student_id and mark = 2;

        if twos_count >= 5 then
            select * into stud
            from students
            where student_id = new.student_id;

            insert into deleted_students (student_id, last_name, first_name, reason)
            values (stud.student_id, stud.last_name, stud.first_name,
                    'Получено 5 или более двоек');

            -- В schema.sql у этих таблиц нет ON DELETE CASCADE.
            delete from student_benefits where student_id = new.student_id;
            delete from student_scholarships where student_id = new.student_id;

            -- Остальные связанные записи (в том числе оценки) удалятся по ON DELETE CASCADE.
            delete from students where student_id = new.student_id;

            raise notice 'Студент % % удалён: количество двоек = %',
                stud.last_name, stud.first_name, twos_count;
        end if;
    end if;

    return new;
end;
$$;

create or replace trigger delete_student_on_fifth_two
after insert or update of mark on field_comprehensions
for each row
execute function delete_student_for_fives();

select * from field_comprehensions
where mark = 2;

insert into field_comprehensions (student_id, field, mark)
VALUES
(847516, 'd7a4dc70-ce84-472b-b91e-41bed9af0d75', 2),
(847516, '18fe07bc-07fd-4410-97e4-eda13b5eb294', 2);

-- Вывод в консоли:
--2026-11-06 16:10:32 [ INFO] Executing: insert into field_comprehensions (student_id, field, mark) VALUES (847516, 'd7a4dc70-ce84-472b-b91e-41bed9af0d75', 2), (847516, '18fe07bc-07fd-4410-97e4-eda13b5eb294', 2)
--2026-11-06 16:10:32 [ INFO] Студент Блюм Андрей удалён: количество двоек = 6
--2026-11-06 16:10:32 [ INFO] Result: 2 rows affected in 22ms

-- Проверка удалений
select * from deleted_students;

