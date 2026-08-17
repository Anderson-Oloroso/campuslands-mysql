-- DQL: 5 Consultas relacionales para verificar el diseño en 3FN
USE campuslands_mysql;

-- 1. Listado de equipos con su respectivo entrenador y sede local asignada
SELECT 
    e.equipo_id,
    e.nombre_equipo,
    ent.nombre_entrenador,
    s.nombre_sede,
    s.ciudad
FROM equipos_futsal_3fn e
INNER JOIN entrenadores_futsal_3fn ent ON e.entrenador_id = ent.entrenador_id
INNER JOIN sedes_futsal_3fn s ON e.sede_id = s.sede_id
WHERE e.estado = 'activo';

-- 2. Conteo de equipos asignados por cada sede
SELECT 
    s.nombre_sede,
    s.ciudad,
    COUNT(e.equipo_id) AS total_equipos
FROM sedes_futsal_3fn s
LEFT JOIN equipos_futsal_3fn e ON s.sede_id = e.sede_id
GROUP BY s.sede_id, s.nombre_sede, s.ciudad;

-- 3. Reporte de partidos jugados con nombres de equipos locales y visitantes
SELECT 
    p.partido_id,
    el.nombre_equipo AS equipo_local,
    ev.nombre_equipo AS equipo_visitante,
    CONCAT(p.goles_local, ' - ', p.goles_visitante) AS resultado,
    p.fecha_partido
FROM partidos_futsal_3fn p
INNER JOIN equipos_futsal_3fn el ON p.equipo_local_id = el.equipo_id
INNER JOIN equipos_futsal_3fn ev ON p.equipo_visitante_id = ev.equipo_id;

-- 4. Promedio de goles anotados por partido como local por equipo
SELECT 
    el.nombre_equipo,
    ROUND(AVG(p.goles_local), 2) AS promedio_goles_local
FROM partidos_futsal_3fn p
INNER JOIN equipos_futsal_3fn el ON p.equipo_local_id = el.equipo_id
GROUP BY el.equipo_id, el.nombre_equipo;

-- 5. Entrenadores dirigiendo más de un equipo en el torneo
SELECT 
    ent.nombre_entrenador,
    ent.licencia,
    COUNT(e.equipo_id) AS total_equipos_dirigidos
FROM entrenadores_futsal_3fn ent
INNER JOIN equipos_futsal_3fn e ON ent.entrenador_id = e.entrenador_id
GROUP BY ent.entrenador_id, ent.nombre_entrenador, ent.licencia
HAVING total_equipos_dirigidos >= 1;
