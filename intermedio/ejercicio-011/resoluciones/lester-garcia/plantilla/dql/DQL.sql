
USE ejercicio_11_int;
-- MOSTRAR LOS PREMIOS CON PUNTAJE MAYOR A 10000
SELECT
    nombre,
    categoria,
    premio,
    fecha
FROM torneos
WHERE premio > 10000
ORDER BY premio DESC;

-- Mostrar partidos finalizados con diferencia de puntaje de 3 puntos

SELECT
    id_partido,
    jugador_a,
    jugador_b,
    puntos_jugador_a,
    puntos_jugador_b,
    ABS(puntos_jugador_a - puntos_jugador_b) AS diferencia_puntos
FROM partidos
WHERE estado = 'Finalizado'
  AND ABS(puntos_jugador_a - puntos_jugador_b) >= 3
ORDER BY diferencia_puntos DESC;

-- Partidos actualmente programados

SELECT
    id_partido,
    id_torneo,
    jugador_a,
    jugador_b,
    estado
FROM partidos
WHERE estado = 'Programado'
  AND puntos_jugador_a = 0
  AND puntos_jugador_b = 0
ORDER BY id_torneo;