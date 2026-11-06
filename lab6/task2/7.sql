-- Active: 1791104200281@@127.0.0.1@5432@students
-- Напишите скрипт, который считает частоту появления каждого имени студента

-- Запросом

select first_name,
round(count(*)::numeric / (select count(*) from students), 3) as freq
from students
group by first_name
order by freq desc, first_name;

-- Скриптом
do
$$
declare
    total_students bigint;
    name_stat record;
    freq numeric;
begin
    select count(*) into total_students from students;
    for name_stat in
        select first_name, count(*) as name_count
        from students
        group by first_name
        order by name_count DESC, first_name
    loop
        freq := round(name_stat.name_count::numeric / total_students, 3);
        raise notice 'Имя: %, количество: %, частота: %',
            name_stat.first_name, name_stat.name_count, freq;
    end loop;
end;
$$ LANGUAGE plpgsql;
