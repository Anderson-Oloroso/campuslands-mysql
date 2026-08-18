-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    j.jugador_id,
    j.gamer_tag,
    j.pais_origen,
    COUNT(p.partida_id) AS total_partidas_jugadas,
    SUM(CASE WHEN p.mision_completada = TRUE THEN 1 ELSE 0 END) AS misiones_exitosas,
    COALESCE(SUM(p.puntuaciones_obtenidas), 0) AS puntaje_acumulado,
    COALESCE(ROUND(AVG(p.duracion_minutos), 2), 0.00) AS tiempo_promedio_partida_min
FROM jugadores_accion j
INNER JOIN partidas_jugador p ON j.jugador_id = p.jugador_id
GROUP BY j.jugador_id, j.gamer_tag, j.pais_origen
ORDER BY puntaje_acumulado DESC;

SELECT 
    m.codigo_mision,
    m.nombre_mision,
    m.region_mapa,
    m.nivel_dificultad,
    COUNT(p.partida_id) AS veces_jugada,
    ROUND((SUM(CASE WHEN p.mision_completada = TRUE THEN 1 ELSE 0 END) / COUNT(p.partida_id)) * 100, 2) AS porcentaje_victoria,
    COALESCE(ROUND(AVG(p.duracion_minutos), 2), 0.00) AS duracion_promedio_min,
    COALESCE(MAX(p.puntuaciones_obtenidas), 0) AS record_puntaje_maximo
FROM misiones_juego m
LEFT JOIN partidas_jugador p ON m.mision_id = p.mision_id
GROUP BY m.mision_id, m.codigo_mision, m.nombre_mision, m.region_mapa, m.nivel_dificultad
ORDER BY veces_jugada DESC, porcentaje_victoria DESC;
