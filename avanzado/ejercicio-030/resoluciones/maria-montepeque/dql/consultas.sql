USE campuslands_mysql;

-- ===================================================================
-- PASO 1: medir la consulta "antes" de optimizar. Sin ningun indice
-- sobre "streamer" (solo existe el indice implicito de la PRIMARY
-- KEY), MySQL no tiene otra opcion que recorrer toda la tabla.
--
-- Resultado real medido al preparar esta resolucion (5000 filas):
--   -> Table scan on eventos_chat_avanzado
--      (cost=500 rows=5000) (actual time=0.419..0.99 rows=5000 loops=1)
--   -> Filter: streamer = 'NightOwlGaming'
--      (cost=500 rows=500) (actual time=0.576..1.5 rows=1000 loops=1)
--   Tiempo total real: actual time=1.81..1.81 (~1.81 ms)
-- ===================================================================
EXPLAIN ANALYZE
SELECT COUNT(*) FROM eventos_chat_avanzado WHERE streamer = 'NightOwlGaming';

-- ===================================================================
-- PASO 2: optimizar. Se crea un indice sobre la columna que se usa
-- para filtrar en casi todas las consultas de este reporte.
-- ===================================================================
CREATE INDEX idx_eventos_chat_avanzado_streamer ON eventos_chat_avanzado (streamer);

-- ===================================================================
-- PASO 3: medir la misma consulta "despues" de optimizar.
--
-- Resultado real medido (misma tabla, mismas 5000 filas):
--   -> Covering index lookup on eventos_chat_avanzado
--      using idx_eventos_chat_avanzado_streamer (streamer='NightOwlGaming')
--      (cost=136 rows=1000) (actual time=0.0344..0.232 rows=1000 loops=1)
--   Tiempo total real: actual time=0.312..0.312 (~0.31 ms)
--
-- Mejora real: de 1.81 ms a 0.31 ms (~5.8 veces mas rapido), y MySQL
-- ya no necesita leer las 5000 filas, solo las 1000 que coinciden
-- (ademas el indice es "covering": no tiene que ir a la tabla, la
-- respuesta se arma solo con el indice).
-- ===================================================================
EXPLAIN ANALYZE
SELECT COUNT(*) FROM eventos_chat_avanzado WHERE streamer = 'NightOwlGaming';

-- 4. Consulta de negocio que ya se beneficia del indice: eventos recientes de un streamer
SELECT tipo_evento, COUNT(*) AS total
FROM eventos_chat_avanzado
WHERE streamer = 'NightOwlGaming'
GROUP BY tipo_evento
ORDER BY total DESC;

-- 5. Distribucion de eventos por streamer (usa el indice para el ORDER BY implicito de GROUP BY)
SELECT streamer, COUNT(*) AS total_eventos
FROM eventos_chat_avanzado
GROUP BY streamer
ORDER BY total_eventos DESC;

-- 6. EXPLAIN de una consulta que filtra por streamer Y tipo_evento:
-- el indice de una sola columna ayuda pero no cubre el segundo filtro
-- (se ve "Using where" ademas de la busqueda por indice).
EXPLAIN
SELECT COUNT(*)
FROM eventos_chat_avanzado
WHERE streamer = 'CodeWithMaria' AND tipo_evento = 'donacion';
