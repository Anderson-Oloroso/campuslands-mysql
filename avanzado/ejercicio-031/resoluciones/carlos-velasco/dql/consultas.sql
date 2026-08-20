USE campuslands_mysql;


-- =========================================================
-- 1. Consultar todas las partidas finalizadas.
-- =========================================================

SELECT
    id_partida,
    equipo_rojo,
    equipo_azul,
    ganador,
    duracion_minutos,
    fecha_partida
FROM partidas_moba
WHERE estado = 'finalizada'
ORDER BY fecha_partida;


-- =========================================================
-- 2. Ranking de equipos según cantidad de victorias.
-- =========================================================

SELECT
    ganador AS equipo,
    COUNT(*) AS victorias
FROM partidas_moba
WHERE estado = 'finalizada'
GROUP BY ganador
ORDER BY victorias DESC;


-- =========================================================
-- 3. Promedio de duración de las partidas finalizadas.
-- =========================================================

SELECT
    COUNT(*) AS partidas_finalizadas,
    ROUND(AVG(duracion_minutos), 2) AS promedio_duracion_minutos,
    MAX(duracion_minutos) AS partida_mas_larga,
    MIN(duracion_minutos) AS partida_mas_corta
FROM partidas_moba
WHERE estado = 'finalizada';


-- =========================================================
-- 4. Partidas largas.
-- =========================================================

SELECT
    id_partida,
    equipo_rojo,
    equipo_azul,
    ganador,
    duracion_minutos
FROM partidas_moba
WHERE estado = 'finalizada'
  AND duracion_minutos >= 40
ORDER BY duracion_minutos DESC;


-- =========================================================
-- 5. Estado actual del torneo.
-- =========================================================

SELECT
    estado,
    COUNT(*) AS total_partidas
FROM partidas_moba
GROUP BY estado
ORDER BY total_partidas DESC;


-- =========================================================
-- 6. TRANSACCIÓN CONFIRMADA CON COMMIT
--
-- Se actualiza una partida en curso con su duración y ganador.
-- COMMIT confirma definitivamente los cambios.
-- =========================================================

START TRANSACTION;

UPDATE partidas_moba
SET
    ganador = 'Dragons Elite',
    duracion_minutos = 38,
    estado = 'finalizada'
WHERE id_partida = 5
  AND estado = 'en_curso';

COMMIT;


-- Verificación de la transacción confirmada.

SELECT
    id_partida,
    equipo_rojo,
    equipo_azul,
    ganador,
    duracion_minutos,
    estado
FROM partidas_moba
WHERE id_partida = 5;


-- =========================================================
-- 7. TRANSACCIÓN REVERTIDA CON ROLLBACK
--
-- Se modifica temporalmente una partida programada.
-- ROLLBACK cancela el cambio.
-- =========================================================

START TRANSACTION;

UPDATE partidas_moba
SET
    estado = 'cancelada'
WHERE id_partida = 6;

ROLLBACK;


-- Verificación de que la partida continúa programada.

SELECT
    id_partida,
    equipo_rojo,
    equipo_azul,
    estado
FROM partidas_moba
WHERE id_partida = 6;


-- =========================================================
-- 8. Consulta final del ranking después de la transacción.
-- =========================================================

SELECT
    ganador AS equipo,
    COUNT(*) AS victorias
FROM partidas_moba
WHERE estado = 'finalizada'
GROUP BY ganador
ORDER BY victorias DESC;