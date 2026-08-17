-- DQL: 5 Consultas relacionales consumiendo el diseño en 2FN mediante JOINs
USE campuslands_mysql;

-- 1. Reporte completo de rendimiento de equipos por estadio
SELECT 
    eq.nombre_equipo,
    es.nombre_estadio,
    es.ciudad,
    r.partidos_jugados,
    r.partidos_ganados,
    r.goles_anotados
FROM rendimiento_equipos_estadio r
INNER JOIN equipos_liga_intermedio eq ON r.equipo_id = eq.equipo_id
INNER JOIN estadios_liga es ON r.estadio_id = es.estadio_id
ORDER BY r.goles_anotados DESC;

-- 2. Porcentaje de efectividad de victoria de los equipos como locales o visitantes
SELECT 
    eq.nombre_equipo,
    es.nombre_estadio,
    r.partidos_jugados,
    r.partidos_ganados,
    ROUND((r.partidos_ganados / r.partidos_jugados) * 100, 2) AS porcentaje_victorias
FROM rendimiento_equipos_estadio r
INNER JOIN equipos_liga_intermedio eq ON r.equipo_id = eq.equipo_id
INNER JOIN estadios_liga es ON r.estadio_id = es.estadio_id
WHERE r.partidos_jugados > 0
ORDER BY porcentaje_victorias DESC;

-- 3. Total de goles anotados por cada equipo sumando todas las sedes
SELECT 
    eq.nombre_equipo,
    eq.director_tecnico,
    SUM(r.goles_anotados) AS total_goles_temporada
FROM rendimiento_equipos_estadio r
INNER JOIN equipos_liga_intermedio eq ON r.equipo_id = eq.equipo_id
GROUP BY eq.equipo_id, eq.nombre_equipo, eq.director_tecnico
ORDER BY total_goles_temporada DESC;

-- 4. Estadios con capacidad mayor a 12,000 espectadores y el total de partidos alojados
SELECT 
    es.nombre_estadio,
    es.capacidad,
    SUM(r.partidos_jugados) AS total_partidos_alojados
FROM estadios_liga es
LEFT JOIN rendimiento_equipos_estadio r ON es.estadio_id = r.estadio_id
WHERE es.capacidad > 12000
GROUP BY es.estadio_id, es.nombre_estadio, es.capacidad
ORDER BY es.capacidad DESC;

-- 5. Equipos que han anotado más de 15 goles en sedes específicas
SELECT 
    eq.nombre_equipo,
    es.nombre_estadio,
    r.goles_anotados
FROM rendimiento_equipos_estadio r
INNER JOIN equipos_liga_intermedio eq ON r.equipo_id = eq.equipo_id
INNER JOIN estadios_liga es ON r.estadio_id = es.estadio_id
WHERE r.goles_anotados > 15
ORDER BY r.goles_anotados DESC;
