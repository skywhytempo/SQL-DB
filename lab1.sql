update fields
set zet = 6
where professor_id in (
	select professor_id
	from professors
	where last_name = 'Астров'
);
select field_name, zet
from fields
where professor_id in (
	select professor_id
	from professors
	where last_name = 'Астров'
);
