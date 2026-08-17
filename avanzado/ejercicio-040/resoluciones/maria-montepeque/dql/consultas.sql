USE campuslands_mysql;

-- 1. Listado completo de resultados
SELECT corredor, carrera, categoria, tiempo_minutos, posicion
FROM resultados_avanzado
ORDER BY carrera, posicion;

-- 2. Resultados por categoria
SELECT categoria, COUNT(*) AS total
FROM resultados_avanzado
GROUP BY categoria
ORDER BY total DESC;

-- 3. Ganadores (posicion 1) de cada carrera
SELECT carrera, corredor, tiempo_minutos
FROM resultados_avanzado
WHERE posicion = 1
ORDER BY carrera;

-- 4. Corredor con el mejor tiempo registrado
SELECT corredor, carrera, tiempo_minutos
FROM resultados_avanzado
ORDER BY tiempo_minutos ASC
LIMIT 1;

-- 5. Tiempo promedio por categoria
SELECT categoria, ROUND(AVG(tiempo_minutos), 2) AS tiempo_promedio
FROM resultados_avanzado
GROUP BY categoria
ORDER BY tiempo_promedio ASC;

-- 6. Resultados de la Maraton de Bogota
SELECT corredor, tiempo_minutos, posicion
FROM resultados_avanzado
WHERE carrera = 'Maraton de Bogota'
ORDER BY posicion;

-- ===================================================================
-- Backup logico con mysqldump (verificado de verdad al preparar esta
-- resolucion, no solo documentado en teoria).
-- ===================================================================
--
-- 1) Generar el backup de la tabla (--single-transaction evita
--    bloquear la tabla en InnoDB mientras se exporta):
--
--   mysqldump -h 127.0.0.1 -P 3307 -u campus -pcampus123 \
--     --single-transaction campuslands_mysql resultados_avanzado \
--     > backup_resultados.sql
--
--   Nota real: con MySQL 8.4 el cliente mysqldump intenta ademas volcar
--   informacion de tablespaces y muestra esta advertencia (no es un
--   error, el backup de la tabla se genera igual):
--     mysqldump: Error: 'Access denied; you need (at least one of) the
--     PROCESS privilege(s) for this operation' when trying to dump
--     tablespaces
--
-- 2) Simular una perdida de datos:
--
--   mysql -u campus -pcampus123 -e "DROP TABLE campuslands_mysql.resultados_avanzado;"
--
-- 3) Restaurar desde el backup:
--
--   mysql -u campus -pcampus123 campuslands_mysql < backup_resultados.sql
--
-- Verificacion real: antes del DROP la tabla tenia 8 filas; despues
-- del DROP, consultarla daba "ERROR 1146: Table ... doesn't exist";
-- despues de restaurar el backup, volvio a tener exactamente 8 filas.
--
-- Para respaldar la base completa (todas las tablas) en vez de una
-- sola tabla:
--
--   mysqldump -h 127.0.0.1 -P 3307 -u campus -pcampus123 \
--     --single-transaction --databases campuslands_mysql \
--     > backup_campuslands_mysql.sql
--
-- El archivo de backup NO se sube al repositorio (regla del proyecto:
-- no subir dumps).
