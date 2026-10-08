
--Вывод - 7


with count_degree AS (

SELECT DISTINCT degree from professors

) SELECT count(degree) FROM count_degree


-- Вывод - 8, т.к. * учитывает null, а count(degree) нет
with count_degree AS (

SELECT DISTINCT degree from professors

) SELECT count(*) FROM count_degree

with count_degree AS (

SELECT DISTINCT degree from professors

) SELECT * FROM count_degree