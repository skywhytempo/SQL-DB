-- Хочу увидеть ФИО, стаж (experience) и оклад (salary) всех преподавателей,
-- чей стаж больше 10 лет, и добавить вычисляемый столбец с текстовой категорией
-- "Ассистент/..." через CASE в зависимости от стажа,
-- отсортировать по стажу по убыванию.
-- для этого есть current position, но поупражняться в кейсах можно

select last_name, first_name, patronymic, experience, case
    when experience < 3 then 'Ассистент'
    when experience < 6 and experience >= 3 then 'Преподаватель'
    when experience < 12 and 6 <= experience then 'Старший преподаватель'
    when experience < 20 and 12 <= experience then 'Доцент'
    when experience >= 20 then 'Профессор'
end
from professors
order by experience desc