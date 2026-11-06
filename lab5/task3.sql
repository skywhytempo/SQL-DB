-- Первый запрос - заполнение таблицы fields_professors случайными преподавателями, которые будут вести предметы своей кафедры


create or replace view rnd_professors_for_field as
with available_for_field_professors as (
    select f.field_id, p.professor_id
    from fields f
    join structural_units su on f.structural_unit_id = su.structural_unit_id
    join employments e on su.structural_unit_id = e.structural_unit_id
    join professors p on e.professor_id = p.professor_id
),

rnd_professors as (
    select field_id, professor_id,
    row_number() over (partition by field_id order by random()) as rn
    from available_for_field_professors
)
select f.field_id, p.professor_id from rnd_professors
join fields f on rnd_professors.field_id = f.field_id
join professors p on rnd_professors.professor_id = p.professor_id
where rn <= 3;

insert into fields_professors (field_id, professor_id)
select field_id, professor_id from rnd_professors_for_field;


select f.field_name, p.first_name, p.last_name
from fields f
join fields_professors fp on f.field_id = fp.field_id
join professors p on fp.professor_id = p.professor_id;


-- Второй запрос - заполнение таблиц льгот и стипендий, созданных в lab4/task3.sql

insert into benefits (benefit_name)
values
    ('Льготный проезд'),
    ('Льготное питание'),
    ('Льготное проживание в общежитии'),
    ('Бесплатное питание'),
    ('Компенсация проезда к месту учебы'),
    ('Льготное посещение спортивного комплекса'),
    ('Льготное санаторное лечение'),
    ('Бесплатное посещение музеев'),
    ('Скидка на дополнительное образование'),
    ('Компенсация расходов на учебные материалы');

insert into scholarships (scholarship_name, amount)
values
    ('Государственная академическая стипендия', 2500.00),
    ('Государственная социальная стипендия', 3500.00),
    ('Повышенная академическая стипендия', 7000.00),
    ('Повышенная социальная стипендия', 8000.00),
    ('Стипендия за научные достижения', 10000.00),
    ('Стипендия за спортивные достижения', 6000.00),
    ('Стипендия за творческие достижения', 5500.00),
    ('Стипендия за общественную деятельность', 5000.00),
    ('Именная стипендия университета', 9000.00),
    ('Стипендия за успехи в программировании', 7500.00);

-- Для каждой льготы выбираем до трех случайных студентов.
-- Если студентов меньше трех, выбираются все имеющиеся студенты.
with rnd_students_for_benefit as (
    select s.student_id, b.benefit_id,
    row_number() over (partition by b.benefit_id order by random()) as rn
    from students s
    cross join benefits b
)
insert into student_benefits (student_id, benefit_id, start_date, end_date)
select student_id, benefit_id, current_date, (current_date + interval '1 year')::date
from rnd_students_for_benefit
where rn <= 3;

-- Для каждой стипендии независимо выбираем до трех случайных студентов.
with rnd_students_for_scholarship as (
    select s.student_id, sc.scholarship_id,
    row_number() over (partition by sc.scholarship_id order by random()) as rn
    from students s
    cross join scholarships sc
)
insert into student_scholarships (student_id, scholarship_id, start_date, end_date)
select student_id, scholarship_id, current_date, (current_date + interval '1 year')::date
from rnd_students_for_scholarship
where rn <= 3;
