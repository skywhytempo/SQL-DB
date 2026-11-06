

create or replace function new_scholarship_member()
returns trigger
LANGUAGE plpgsql
as $$
declare
    stud record;
    scholarship varchar;
BEGIN
    select last_name, first_name into stud
    from students
    where student_id = new.student_id;

    select scholarship_name into scholarship
    from scholarships
    where scholarship_id = new.scholarship_id;

    raise notice 'Новый стипендиат: % %. Стипендия: %',
    stud.last_name, stud.first_name, scholarship;

    return new;
end;
$$

create or replace trigger scholarship_added
after insert on student_scholarships
for each row
execute function new_scholarship_member();


