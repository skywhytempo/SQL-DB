-- Автоматически заполните поле телефон преподавателя в формате, заданном в предыдущей лабораторной работе (+7(XXX)XXX–XX–XX). Укажите код оператора 903, в случае четного порядкового номера преподавателя в таблице professors, иначе – 967. Следующие три цифры номера – первые три цифры кода преподавателя. Предпоследнюю пару цифр сгенерируйте рандомно, вместо последней используйте порядковый номер преподавателя в таблице professors, отсортированной по фамилии. Если порядковый номер <10 , добавьте вначале 0 (5  05).

with numbered_professors as (
    select professor_id,
    row_number() over (order by last_name, professor_id) as rn
    from professors
)
update professors
set phone_number = 
    '+7(' || 
    case when numbered_professors.rn % 2 = 0 then '903' else '967' end || 
    ')' || 
    substring(cast(professors.professor_id as varchar), 1, 3) || 
    '-' || 
    lpad(cast(floor(random() * 100) as varchar), 2, '0') || 
    '-' || 
    lpad(cast(numbered_professors.rn as varchar), 2, '0')
from numbered_professors
where professors.professor_id = numbered_professors.professor_id;

select * from professors