-- В учебной базе данных одним из допущений является возможность прикрепить только одного преподавателя к дисциплине. Исправьте его

create table fields_professors(
    field_id uuid references fields(field_id),
    professor_id integer references professors(professor_id),
    primary key(field_id, professor_id)
);

alter table fields drop column professor_id;