-- Добавить возможность получения студентами льгот и стипендии

-- 4 таблицы: 2 на хранение информации о льготах/стипендиях(id - serial для автоувеличения, наименования, размер у стипендии), 2 на связь студентов с льготами/стипендиями (id студента, id льготы/стипендии, дата начала действия, дата окончания действия)

create table benefits(
    benefit_id serial primary key,
    benefit_name varchar(100) not null
);

create table scholarships(
    scholarship_id serial primary key,
    scholarship_name varchar(100) not null,
    amount numeric(10, 2) not null
);

create table student_benefits(
    student_id integer references students(student_id),
    benefit_id integer references benefits(benefit_id),
    start_date date not null,
    end_date date not null,
    primary key(student_id, benefit_id)
);

create table student_scholarships(
    student_id integer references students(student_id),
    scholarship_id integer references scholarships(scholarship_id),
    start_date date not null,
    end_date date not null,
    primary key(student_id, scholarship_id)
);