USE campuslands_mysql;

-- 1. promedio de puntos de ranking por region para equipos activos
SELECT region, AVG(puntos_ranking) AS promedio_ranking, COUNT(*) AS total_equipos
FROM equipos_moba
WHERE estado != 'eliminado'
GROUP BY region;

-- 2. top 3 equipos con mayor puntaje en el ranking del torneo MOBA
SELECT nombre, region, puntos_ranking, premio_acumulado, estado
FROM equipos_moba
ORDER BY puntos_ranking DESC
LIMIT 3;

-- 3. listado de equipos filtrados por una region especifica
SELECT nombre, puntos_ranking, premio_acumulado, estado
FROM equipos_moba
WHERE region = 'EMEA'
ORDER BY puntos_ranking DESC;

-- 4. reporte de equipos agrupados por estado actual con acumulado total de premios
SELECT estado, COUNT(*) AS cantidad_equipos, SUM(premio_acumulado) AS total_premios
FROM equipos_moba
GROUP BY estado;

-- 5. historial de transferencias con detalles del costo y transaccion segura
SELECT t.jugjugador AS jugador, eo.nombre AS equipo_origen, ed.nombre AS equipo_destino, t.costo_transferencia, t.fecha_transaccion
FROM transferencias_jugadores t
JOIN equipos_moba eo ON t.equipo_origen_id = eo.id
JOIN equipos_moba ed ON t.equipo_destino_id = ed.id;