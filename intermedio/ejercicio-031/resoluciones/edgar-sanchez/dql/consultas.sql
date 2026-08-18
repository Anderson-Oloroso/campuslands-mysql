-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    p.partida_id,
    t.nombre_torneo,
    t.fase,
    eq_azul.nombre_equipo AS equipo_azul,
    eq_rojo.nombre_equipo AS equipo_rojo,
    eq_ganador.nombre_equipo AS equipo_ganador,
    ROUND(p.duracion_segundos / 60.0, 2) AS duracion_minutos,
    p.fecha_partida
FROM partidas_torneo p
INNER JOIN torneos_moba t ON p.torneo_id = t.torneo_id
INNER JOIN equipos_esports eq_azul ON p.equipo_azul_id = eq_azul.equipo_id
INNER JOIN equipos_esports eq_rojo ON p.equipo_rojo_id = eq_rojo.equipo_id
INNER JOIN equipos_esports eq_ganador ON p.equipo_ganador_id = eq_ganador.equipo_id
ORDER BY p.fecha_partida DESC;

SELECT 
    j.jugador_id,
    j.nickname,
    j.rol_juego,
    eq.nombre_equipo,
    s.campeon_usado,
    t.nombre_torneo,
    s.asesinatos,
    s.muertes,
    s.asistencias,
    ROUND((s.asesinatos + s.asistencias) / GREATEST(s.muertes, 1), 2) AS kda_ratio,
    s.oro_obtenido
FROM estadisticas_jugador_partida s
INNER JOIN jugadores_moba j ON s.jugador_id = j.jugador_id
INNER JOIN equipos_esports eq ON j.equipo_id = eq.equipo_id
INNER JOIN partidas_torneo p ON s.partida_id = p.partida_id
INNER JOIN torneos_moba t ON p.torneo_id = t.torneo_id
ORDER BY kda_ratio DESC, s.oro_obtenido DESC;