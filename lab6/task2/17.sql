-- Напишите скрипт, выводящий фамилию, имя, дату рождения и знак зодиака студентов совместимых с вами по знаку зодиака. Совместимость найти в любом гороскопе.
-- Нужные мне знаки зодиака: Рыбы(20.02 - 20.03), Рак(22.06 - 22.07)

do
$$
declare
    pisces_day integer := 20;
    cancer_day integer := 22;
    pisces_month_start integer := 2;
    pisces_month_end integer := 3;
    cancer_month_start integer := 6;
    cancer_month_end integer := 7;
    stud_stat record;
begin
    for stud_stat IN
        select last_name, first_name, birthday
        from students
        order by birthday
    LOOP
        -- Условие на Рыб
        if (extract(month from stud_stat.birthday) = 2
        and extract(day from stud_stat.birthday) >= 20)
        or (extract(month from stud_stat.birthday) = 3 
        and extract(day from stud_stat.birthday) <= 20) 
        THEN
            raise notice '% %, Знак зодика: Рыбы, Дата рождения: %',
            stud_stat.last_name, stud_stat.first_name, stud_stat.birthday;
        -- Условие на Раков
        elseif (extract(month from stud_stat.birthday) = 6
        and extract(day from stud_stat.birthday) >= 22)
        or (extract(month from stud_stat.birthday) = 7 
        and extract(day from stud_stat.birthday) <= 22)
        THEN
            raise notice '% %, Знак зодика: Рак, Дата рождения: %',
            stud_stat.last_name, stud_stat.first_name, stud_stat.birthday;
        end if;
    end loop;
end;
$$
LANGUAGE plpgsql;