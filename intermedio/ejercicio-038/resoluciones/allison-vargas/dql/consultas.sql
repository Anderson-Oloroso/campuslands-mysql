USE futbol_sala_3fn_db;

-- Consulta 1: Listado completo de equipos con su ciudad y pabellón mediante INNER JOIN estructurado en 3FN
SELECT 
    e.id_equipo AS 'ID',
    e.nombre_equipo AS 'Equipo',
    c.nombre_ciudad AS 'Ciudad',
    c.pais AS 'País',
    e.pabellon AS 'Pabellón'
FROM equipos_sala e
JOIN ciudades c ON e.id_ciudad = c.id_ciudad
ORDER BY e.nombre_equipo ASC;

-- Consulta 2: Detalle completo de partidos finalizados cruzando nombres de equipos locales y visitantes
SELECT 
    p.id_partido AS 'ID',
    el.nombre_equipo AS 'Local',
    p.goles_local AS 'GF Local',
    ev.nombre_equipo AS 'Visitante',
    p.goles_visitante AS 'GF Visitante',
    p.fecha_partido AS 'Fecha'
FROM partidos_sala p
JOIN equipos_sala el ON p.id_equipo_local = el.id_equipo
JOIN equipos_sala ev ON p.id_equipo_visitante = ev.id_equipo
WHERE p.estado_partido = 'Finalizado'
ORDER BY p.fecha_partido ASC;

-- Consulta 3: Top 3 de encuentros con mayor cantidad de goles anotados utilizando la estructura normalizada
SELECT 
    el.nombre_equipo AS 'Equipo Local',
    ev.nombre_equipo AS 'Equipo Visitante',
    (p.goles_local + p.goles_visitante) AS 'Total de Goles'
FROM partidos_sala p
JOIN equipos_sala el ON p.id_equipo_local = el.id_equipo
JOIN equipos_sala ev ON p.id_equipo_visitante = ev.id_equipo
WHERE p.estado_partido = 'Finalizado'
ORDER BY 'Total de Goles' DESC
LIMIT 3;

-- Consulta 4: Reporte estadístico agrupado por ciudad calculando la cantidad de equipos radicados en cada una
SELECT 
    c.nombre_ciudad AS 'Ciudad',
    COUNT(e.id_equipo) AS 'Total de Equipos'
FROM ciudades c
LEFT JOIN equipos_sala e ON c.id_ciudad = e.id_ciudad
GROUP BY c.nombre_ciudad
ORDER BY 'Total de Equipos' DESC;

-- Consulta 5: Listado de partidos pendientes de disputar (Programados) con detalles de sus sedes
SELECT 
    p.id_partido AS 'ID Partido',
    el.nombre_equipo AS 'Local',
    ev.nombre_equipo AS 'Visitante',
    el.pabellon AS 'Sede del Partido',
    p.fecha_partido AS 'Fecha Programada'
FROM partidos_sala p
JOIN equipos_sala el ON p.id_equipo_local = el.id_equipo
JOIN equipos_sala ev ON p.id_equipo_visitante = ev.id_equipo
WHERE p.estado_partido = 'Programado'
ORDER BY p.fecha_partido ASC;
