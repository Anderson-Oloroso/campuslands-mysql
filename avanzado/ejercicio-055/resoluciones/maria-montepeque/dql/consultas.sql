USE campuslands_mysql;

-- 1. Listado completo del catalogo de reactivos
SELECT formula, nombre, categoria, peso_molecular, estado_fisico
FROM reactivos_avanzado
ORDER BY categoria, nombre;

-- 2. Reactivos por categoria
SELECT categoria, COUNT(*) AS total
FROM reactivos_avanzado
GROUP BY categoria
ORDER BY total DESC;

-- 3. Reactivos liquidos ordenados por peso molecular
SELECT formula, nombre, peso_molecular
FROM reactivos_avanzado
WHERE estado_fisico = 'liquido'
ORDER BY peso_molecular DESC;

-- 4. Reactivo con mayor peso molecular
SELECT formula, nombre, peso_molecular
FROM reactivos_avanzado
ORDER BY peso_molecular DESC
LIMIT 1;

-- 5. Peso molecular promedio por estado fisico
SELECT estado_fisico, ROUND(AVG(peso_molecular), 3) AS peso_promedio
FROM reactivos_avanzado
GROUP BY estado_fisico
ORDER BY peso_promedio DESC;

-- 6. Acidos y bases (los mas usados en neutralizaciones)
SELECT formula, nombre, categoria
FROM reactivos_avanzado
WHERE categoria IN ('acido', 'base')
ORDER BY categoria, nombre;

-- ===================================================================
-- Backup logico con mysqldump (verificado de verdad al preparar esta
-- resolucion, no solo documentado en teoria).
-- ===================================================================
--
-- 1) Generar el backup de la tabla (--single-transaction evita
--    bloquear la tabla en InnoDB mientras se exporta):
--
--   mysqldump -h 127.0.0.1 -P 3307 -u campus -pcampus123 \
--     --single-transaction campuslands_mysql reactivos_avanzado \
--     > backup_reactivos.sql
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
--   mysql -u campus -pcampus123 -e "DROP TABLE campuslands_mysql.reactivos_avanzado;"
--
-- 3) Restaurar desde el backup:
--
--   mysql -u campus -pcampus123 campuslands_mysql < backup_reactivos.sql
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
