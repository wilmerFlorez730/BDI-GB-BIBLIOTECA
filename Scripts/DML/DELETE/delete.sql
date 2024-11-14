DO
$$
DECLARE
    tabla RECORD;
BEGIN
    -- Desactiva temporalmente las restricciones de clave externa
    PERFORM 'SET session_replication_role = replica';

    -- Itera sobre cada tabla en el esquema público y ejecuta TRUNCATE
    FOR tabla IN
        SELECT tablename FROM pg_tables
        WHERE schemaname = 'public'
    LOOP
        -- Trunca la tabla, reinicia los contadores de identidad y cascada en las claves foráneas
        EXECUTE 'TRUNCATE TABLE public.' || quote_ident(tabla.tablename) || ' RESTART IDENTITY CASCADE';
    END LOOP;

    -- Reactiva las restricciones de clave externa
    PERFORM 'SET session_replication_role = DEFAULT';
END;
$$;
