USE campuslands_mysql;

-- ===================================================================
-- PASO 1: medir la consulta "antes" de optimizar. Sin ningun indice
-- sobre "usuario" (solo existe el indice implicito de la PRIMARY
-- KEY), MySQL no tiene otra opcion que recorrer toda la tabla.
--
-- Resultado real medido al preparar esta resolucion (5000 filas):
--   -> Table scan on actividad_biblioteca_avanzado
--      (cost=499 rows=4990) (actual time=0.21..0.84 rows=5000 loops=1)
--   -> Filter: usuario = 'NightOwlGamer'
--      (cost=499 rows=499) (actual time=0.876..1.85 rows=1000 loops=1)
--   Tiempo total real: actual time=1.93..1.93 (~1.93 ms)
-- ===================================================================
EXPLAIN ANALYZE
SELECT COUNT(*) FROM actividad_biblioteca_avanzado WHERE usuario = 'NightOwlGamer';

-- ===================================================================
-- PASO 2: optimizar. Se crea un indice sobre la columna que se usa
-- para filtrar en casi todas las consultas de este reporte.
-- ===================================================================
CREATE INDEX idx_actividad_biblioteca_avanzado_usuario ON actividad_biblioteca_avanzado (usuario);

-- ===================================================================
-- PASO 3: medir la misma consulta "despues" de optimizar.
--
-- Resultado real medido (misma tabla, mismas 5000 filas):
--   -> Covering index lookup on actividad_biblioteca_avanzado
--      using idx_actividad_biblioteca_avanzado_usuario (usuario='NightOwlGamer')
--      (cost=135 rows=1000) (actual time=0.0314..0.224 rows=1000 loops=1)
--   Tiempo total real: actual time=0.291..0.291 (~0.29 ms)
--
-- Mejora real: de 1.93 ms a 0.29 ms (~6.6 veces mas rapido), y MySQL
-- ya no necesita leer las 5000 filas, solo las 1000 que coinciden
-- (ademas el indice es "covering": no tiene que ir a la tabla, la
-- respuesta se arma solo con el indice).
-- ===================================================================
EXPLAIN ANALYZE
SELECT COUNT(*) FROM actividad_biblioteca_avanzado WHERE usuario = 'NightOwlGamer';

-- 4. Consulta de negocio que ya se beneficia del indice: actividad de un usuario, por tipo
SELECT tipo_actividad, COUNT(*) AS total
FROM actividad_biblioteca_avanzado
WHERE usuario = 'NightOwlGamer'
GROUP BY tipo_actividad
ORDER BY total DESC;

-- 5. Distribucion de actividad por usuario
SELECT usuario, COUNT(*) AS total_actividad
FROM actividad_biblioteca_avanzado
GROUP BY usuario
ORDER BY total_actividad DESC;

-- 6. EXPLAIN de una consulta que filtra por usuario Y tipo_actividad:
-- el indice de una sola columna ayuda pero no cubre el segundo filtro
-- (se ve "Using where" ademas de la busqueda por indice).
-- Resultado real: type=ref, key=idx_actividad_biblioteca_avanzado_usuario,
-- rows=1000, filtered=25.00, Extra=Using where.
EXPLAIN
SELECT COUNT(*)
FROM actividad_biblioteca_avanzado
WHERE usuario = 'CodeAndPlay' AND tipo_actividad = 'compra';
