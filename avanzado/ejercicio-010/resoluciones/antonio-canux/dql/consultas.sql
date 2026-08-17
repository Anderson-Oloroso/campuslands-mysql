-- Consultas base demostrando operaciones de Backup Logico.
USE campuslands_mysql;

-- 1. Verificacion del estado actual de la tabla en produccion
SELECT id, piloto, coche, valor_estimado 
    FROM avanzado_ejercicio_010_autos;

-- 2. Ejecucion del Backup Logico a nivel SQL (Volcado de datos a tabla de respaldo)
INSERT INTO avanzado_ejercicio_010_autos_backup (id, piloto, coche, modificacion_motor, valor_estimado, creado_en)
SELECT id, piloto, coche, modificacion_motor, valor_estimado, creado_en 
    FROM avanzado_ejercicio_010_autos;
SELECT COUNT(*) AS registros_respaldados 
    FROM avanzado_ejercicio_010_autos_backup;

-- 3. [Documentacion] Comando CLI mysqldump para exportar la base de datos a un archivo .sql
-- Comando a ejecutar en la terminal del sistema operativo (No en MySQL):
-- mysqldump -u root -p campuslands_mysql avanzado_ejercicio_010_autos > backup_carreras.sql

-- 4. Simulacion de perdida de datos en produccion (Truncado accidental o borrado masivo)
DELETE FROM avanzado_ejercicio_010_autos 
    WHERE valor_estimado < 100000;
SELECT COUNT(*) AS registros_restantes 
    FROM avanzado_ejercicio_010_autos;

-- 5. Restauracion de datos desde el backup logico (Recuperando los registros perdidos)
INSERT INTO avanzado_ejercicio_010_autos (id, piloto, coche, modificacion_motor, valor_estimado, creado_en)
SELECT id, piloto, coche, modificacion_motor, valor_estimado, creado_en 
    FROM avanzado_ejercicio_010_autos_backup
    WHERE id NOT IN (SELECT id 
        FROM avanzado_ejercicio_010_autos);
SELECT id, piloto, coche, valor_estimado 
    FROM avanzado_ejercicio_010_autos 
    ORDER BY id ASC;