-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;
SELECT 
    j.jugador_id,
    j.nickname,
    r.nombre_rango,
    j.nivel_cuenta,
    COUNT(rp.partida_id) AS total_partidas_jugadas,
    SUM(CASE WHEN rp.posicion_final = 1 THEN 1 ELSE 0 END) AS victorias_victoria_real,
    COALESCE(SUM(rp.eliminaciones), 0) AS total_eliminaciones,
    COALESCE(SUM(rp.dano_infligido), 0) AS dano_total_acumulado,
    COALESCE(SUM(rp.puntos_rank_obtenidos), 0) AS puntos_rank_netos
FROM jugadores_br j
INNER JOIN rangos_temporada r ON j.rango_id = r.rango_id
LEFT JOIN resultados_jugador_partida rp ON j.jugador_id = rp.jugador_id
GROUP BY j.jugador_id, j.nickname, r.nombre_rango, j.nivel_cuenta
ORDER BY victorias_victoria_real DESC, total_eliminaciones DESC, j.jugador_id ASC;

SELECT 
    j.jugador_id,
    j.nickname,
    j.correo,
    r.nombre_rango,
    j.fecha_registro
FROM jugadores_br j
INNER JOIN rangos_temporada r ON j.rango_id = r.rango_id
LEFT JOIN resultados_jugador_partida rp ON j.jugador_id = rp.jugador_id
WHERE rp.resultado_id IS NULL
ORDER BY j.fecha_registro ASC;
