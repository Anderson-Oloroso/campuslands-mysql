USE campuslands_mysql;

SELECT
    id_jugador,
    nombre,
    nickname,
    edad,
    rango,
    puntaje,
    estado
FROM jugadores
ORDER BY puntaje DESC;

SELECT
    nickname,
    nombre,
    rango,
    puntaje
FROM jugadores
WHERE estado = 'activo'
ORDER BY puntaje DESC;

SELECT
    nickname,
    nombre,
    rango,
    puntaje
FROM jugadores
ORDER BY puntaje DESC
LIMIT 5;

SELECT
    nickname,
    partidas_jugadas,
    victorias,
    eliminaciones
FROM jugadores
WHERE partidas_jugadas > 200
ORDER BY partidas_jugadas DESC;

SELECT
    COUNT(*) AS total_jugadores_activos,
    AVG(puntaje) AS puntaje_promedio
FROM jugadores
WHERE estado = 'activo';

SELECT
    COUNT(*) AS total_jugadores,
    MAX(puntaje) AS puntaje_maximo,
    MIN(puntaje) AS puntaje_minimo,
    AVG(puntaje) AS puntaje_promedio,
    SUM(eliminaciones) AS eliminaciones_totales
FROM jugadores;