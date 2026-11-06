DO
$$
DECLARE
    avg_mark numeric;
    v_student_id INTEGER := 847516; -- Укажите нужный ID студента.
BEGIN
    SELECT round(avg(fc.mark), 2)
    INTO avg_mark
    FROM field_comprehensions AS fc
    WHERE fc.student_id = v_student_id;
    RAISE NOTICE 'Student I: %, AVG mark: %', v_student_id, avg_mark;
END;
$$ LANGUAGE plpgsql;
