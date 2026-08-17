USE campuslands_mysql;

-- 1. Listado de partidas con el nombre de ambos equipos (INNER JOIN doble sobre la misma tabla)
SELECT p.id_partida,
       el.nombre_equipo AS equipo_local,
       p.marcador_local,
       p.marcador_visitante,
       ev.nombre_equipo AS equipo_visitante,
       p.fase,
       p.fecha
FROM partidas_intermedio p
INNER JOIN equipos_intermedio el ON el.id_equipo = p.id_equipo_local
INNER JOIN equipos_intermedio ev ON ev.id_equipo = p.id_equipo_visitante
ORDER BY p.fecha;

-- 2. Partidas de la fase final
SELECT el.nombre_equipo AS equipo_local, p.marcador_local, p.marcador_visitante, ev.nombre_equipo AS equipo_visitante
FROM partidas_intermedio p
INNER JOIN equipos_intermedio el ON el.id_equipo = p.id_equipo_local
INNER JOIN equipos_intermedio ev ON ev.id_equipo = p.id_equipo_visitante
WHERE p.fase = 'final';

-- 3. Todas las partidas de "Furia Andina", jugando de local o de visitante
SELECT p.id_partida, el.nombre_equipo AS equipo_local, p.marcador_local, p.marcador_visitante, ev.nombre_equipo AS equipo_visitante, p.fase
FROM partidas_intermedio p
INNER JOIN equipos_intermedio el ON el.id_equipo = p.id_equipo_local
INNER JOIN equipos_intermedio ev ON ev.id_equipo = p.id_equipo_visitante
WHERE el.nombre_equipo = 'Furia Andina' OR ev.nombre_equipo = 'Furia Andina'
ORDER BY p.fecha;

-- 4. Cantidad de victorias como local, por equipo
SELECT el.nombre_equipo AS equipo, COUNT(*) AS victorias_de_local
FROM partidas_intermedio p
INNER JOIN equipos_intermedio el ON el.id_equipo = p.id_equipo_local
WHERE p.marcador_local > p.marcador_visitante
GROUP BY el.nombre_equipo
ORDER BY victorias_de_local DESC;

-- 5. Partidas por fase del torneo
SELECT fase, COUNT(*) AS total_partidas
FROM partidas_intermedio
GROUP BY fase
ORDER BY FIELD(fase, 'grupos', 'cuartos', 'semifinal', 'final');

-- 6. Partidas con el marcador mas parejo (menor diferencia de puntos)
SELECT el.nombre_equipo AS equipo_local, p.marcador_local, p.marcador_visitante, ev.nombre_equipo AS equipo_visitante,
       ABS(p.marcador_local - p.marcador_visitante) AS diferencia
FROM partidas_intermedio p
INNER JOIN equipos_intermedio el ON el.id_equipo = p.id_equipo_local
INNER JOIN equipos_intermedio ev ON ev.id_equipo = p.id_equipo_visitante
ORDER BY diferencia ASC, p.fecha
LIMIT 3;
