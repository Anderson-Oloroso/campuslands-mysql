USE liga_futbol;

-- 1. Vista de rendimiento general de equipos
CREATE OR REPLACE VIEW vista_rendimiento AS
SELECT e.nombre, 
       SUM(CASE WHEN p.id_equipo_local = e.id_equipo THEN p.goles_local ELSE p.goles_visitante END) AS goles_a_favor
FROM equipos e
JOIN partidos p ON e.id_equipo = p.id_equipo_local OR e.id_equipo = p.id_equipo_visitante
WHERE p.estado = 'finalizado'
GROUP BY e.id_equipo;

-- 2. Total de partidos jugados por equipo
SELECT nombre, COUNT(p.id_partido) AS partidos_jugados
FROM equipos e
LEFT JOIN partidos p ON e.id_equipo = p.id_equipo_local OR e.id_equipo = p.id_equipo_visitante
GROUP BY e.id_equipo;

-- 3. Top 3 equipos con más goles
SELECT nombre, goles_a_favor FROM vista_rendimiento ORDER BY goles_a_favor DESC LIMIT 3;

-- 4. Promedio de goles por partido en la liga
SELECT AVG(goles_local + goles_visitante) AS promedio_goles_liga FROM partidos WHERE estado = 'finalizado';

-- 5. Partidos con alta intensidad (más de 3 goles en total)
SELECT id_partido, goles_local + goles_visitante AS total_goles
FROM partidos 
WHERE (goles_local + goles_visitante) > 3;