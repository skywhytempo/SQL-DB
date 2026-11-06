-- Создайте функцию, выводящую всех студентов именинников в определенном диапазоне.
-- Входные параметры – дата рождения и количество дней диапазона (плюс, минус).

-- Сравниваем только день и месяц рождения, а не год.
-- Для корректной работы на границе года и с 29 февраля используем високосный 2000 год.
create or replace function birthday_students(input_date date, days_range integer)
returns table (last_name varchar(30), first_name varchar(30), birthday date)
language SQL
AS $$
    select s.last_name, s.first_name, s.birthday
    from students s
    where least(
        abs(make_date(2000, extract(month from s.birthday)::integer,extract(day from s.birthday)::integer)
            - make_date(2000, extract(month from input_date)::integer,extract(day from input_date)::integer)),
        366 - abs(make_date(2000, extract(month from s.birthday)::integer,extract(day from s.birthday)::integer) - make_date(2000, extract(month from input_date)::integer, extract(day from input_date)::integer))
    ) <= days_range
    order by extract(month from s.birthday), extract(day from s.birthday), s.last_name;
$$;

-- Проверка: именинники за 7 дней до и после 2 ноября
select * from birthday_students('2006-11-02', 7);
