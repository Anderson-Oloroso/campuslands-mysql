USE pingpong_torneo_db;

-- 1. Listado completo de partidos relacionando jugadores, categoria del torneo, sets disputados, duracion y estado actual
SELECT p.codigo_partido, p.jugador_uno, p.jugador_dos, c.nombre_categoria AS categoria, CONCAT(p.sets_jugador_uno, ' - ', p.sets_jugador_dos) AS marcador, p.duracion_minutos, p.estado_partido
FROM partidos_pingpong p
JOIN categorias_torneo c ON p.id_categoria = c.id_categoria
ORDER BY p.duracion_minutos DESC;

-- 2. Conteo de partidos, duracion promedio y tiempo total acumulado agrupados por categoria del torneo
SELECT c.nombre_categoria AS categoria, c.nivel_competencia, COUNT(p.id_partido) AS total_partidos, ROUND(AVG(p.duracion_minutos), 1) AS duracion_promedio_min, SUM(p.duracion_minutos) AS tiempo_total_minutos
FROM categorias_torneo c
LEFT JOIN partidos_pingpong p ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria, c.nombre_categoria, c.nivel_competencia
ORDER BY total_partidos DESC;

-- 3. Partidos que se encuentran con estado 'finalizado' ordenados por duracion de mayor a menor
SELECT p.codigo_partido, p.jugador_uno, p.jugador_dos, c.nombre_categoria AS categoria, p.sets_jugador_uno, p.sets_jugador_dos, p.duracion_minutos
FROM partidos_pingpong p
JOIN categorias_torneo c ON p.id_categoria = c.id_categoria
WHERE p.estado_partido = 'finalizado'
ORDER BY p.duracion_minutos DESC;

-- 4. Top 5 de partidos mas largos en duracion de todo el torneo de tenis de mesa
SELECT p.codigo_partido, p.jugador_uno, p.jugador_dos, c.nombre_categoria AS categoria, p.duracion_minutos, p.estado_partido
FROM partidos_pingpong p
JOIN categorias_torneo c ON p.id_categoria = c.id_categoria
ORDER BY p.duracion_minutos DESC
LIMIT 5;

-- 5. Analisis estadistico de rendimiento por estado del partido evaluando la cantidad de encuentros y la duracion media
SELECT p.estado_partido, COUNT(*) AS cantidad_partidos, ROUND(AVG(p.sets_jugador_uno + p.sets_jugador_dos), 1) AS promedio_sets_por_partido, ROUND(AVG(p.duracion_minutos), 1) AS duracion_media_minutos
FROM partidos_pingpong p
GROUP BY p.estado_partido
ORDER BY cantidad_partidos DESC;