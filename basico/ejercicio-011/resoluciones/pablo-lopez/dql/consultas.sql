USE academia_pingpong;

SELECT
    id_jugador,
    nombre,
    categoria,
    puntaje
FROM jugadores
WHERE estado = 'activo';

SELECT
    nombre,
    categoria,
    puntaje
FROM jugadores
WHERE estado = 'activo'
ORDER BY puntaje DESC;

SELECT
    nombre,
    categoria,
    puntaje
FROM jugadores
WHERE estado = 'activo'
ORDER BY puntaje DESC
LIMIT 5;

SELECT
    categoria,
    COUNT(*) AS total_jugadores,
    AVG(puntaje) AS promedio_puntaje
FROM jugadores
WHERE estado = 'activo'
GROUP BY categoria
ORDER BY promedio_puntaje DESC;

SELECT
    nombre,
    edad,
    categoria,
    puntaje
FROM jugadores
WHERE edad >= 18
ORDER BY edad DESC;

SELECT
    COUNT(*) AS jugadores_activos,
    SUM(puntaje) AS puntaje_total,
    AVG(puntaje) AS puntaje_promedio
FROM jugadores
WHERE estado = 'activo';