USE liga_futbol_2fn_db;

-- Consulta 1: Listado general de jugadores con sus respectivos equipos mediante INNER JOIN (Integridad 2FN)
SELECT 
    j.id_jugador AS 'ID',
    j.nombre_jugador AS 'Jugador',
    j.posicion AS 'Posición',
    j.dorsal AS 'Dorsal',
    e.nombre_equipo AS 'Equipo',
    e.ciudad AS 'Ciudad'
FROM jugadores j
JOIN equipos e ON j.id_equipo = e.id_equipo
ORDER BY e.nombre_equipo ASC;

-- Consulta 2: Reporte de rendimiento individual uniendo jugadores y sus estadísticas en los partidos
SELECT 
    j.nombre_jugador AS 'Jugador',
    j.posicion AS 'Posición',
    r.goles_anotados AS 'Goles',
    r.asistencias AS 'Asistencias',
    r.minutos_jugados AS 'Minutos en Cancha'
FROM jugadores j
JOIN rendimiento_partidos r ON j.id_jugador = r.id_jugador
ORDER BY r.goles_anotados DESC, r.asistencias DESC;

-- Consulta 3: Filtrar jugadores ofensivos que hayan anotado al menos 2 goles en sus partidos
SELECT 
    j.nombre_jugador AS 'Jugador',
    e.nombre_equipo AS 'Equipo',
    r.goles_anotados AS 'Goles Anotados'
FROM jugadores j
JOIN equipos e ON j.id_equipo = e.id_equipo
JOIN rendimiento_partidos r ON j.id_jugador = r.id_jugador
WHERE r.goles_anotados >= 2
ORDER BY r.goles_anotados DESC;

-- Consulta 4: Promedio general de minutos jugados y asistencias agrupados por la posición del jugador
SELECT 
    j.posicion AS 'Posición en Campo',
    COUNT(*) AS 'Total de Jugadores',
    AVG(r.minutos_jugados) AS 'Promedio Minutos Jugados',
    SUM(r.asistencias) AS 'Total Asistencias'
FROM jugadores j
JOIN rendimiento_partidos r ON j.id_jugador = r.id_jugador
GROUP BY j.posicion
ORDER BY 'Total Asistencias' DESC;

-- Consulta 5: Top 3 de jugadores con mayor participación ofensiva directa (Goles + Asistencias)
SELECT 
    j.nombre_jugador AS 'Jugador',
    e.nombre_equipo AS 'Equipo',
    r.goles_anotados AS 'Goles',
    r.asistencias AS 'Asistencias',
    (r.goles_anotados + r.asistencias) AS 'Participación Ofensiva Total'
FROM jugadores j
JOIN equipos e ON j.id_equipo = e.id_equipo
JOIN rendimiento_partidos r ON j.id_jugador = r.id_jugador
ORDER BY 'Participación Ofensiva Total' DESC
LIMIT 3;
