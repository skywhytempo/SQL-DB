-- Добавьте в таблицу professors поле, содержащее его контактный телефон. Сделайте ограничение, позволяющее хранить номер телефона в формате: +7(XXX)XXX-XX-XX

alter table professors
add column phone_number varchar(16)
check (phone_number ~ '^\+7\(\d{3}\)\d{3}-\d{2}-\d{2}$');