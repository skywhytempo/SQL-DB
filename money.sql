--SELECT column_name, data_type, udt_name
--FROM information_schema.columns
-- table_schema = 'public'
--AND table_name = 'professors';

alter table professors
alter column salary type numeric;
