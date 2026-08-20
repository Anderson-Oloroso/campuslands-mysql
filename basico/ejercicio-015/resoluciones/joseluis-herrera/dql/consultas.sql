USE campuslands_mysql;

SELECT
    u.nombre AS usuario,
    v.titulo AS videojuego,
    v.plataforma,
    v.genero,
    v.estado
FROM usuarios AS u
INNER JOIN videojuegos AS v
    ON u.id = v.usuario_id
ORDER BY u.nombre, v.titulo;

SELECT
    u.nombre AS usuario,
    v.titulo AS videojuego,
    v.plataforma,
    v.puntaje
FROM usuarios AS u
INNER JOIN videojuegos AS v
    ON u.id = v.usuario_id
WHERE v.estado = 'jugando'
ORDER BY v.puntaje DESC;

SELECT
    u.nombre AS usuario,
    COUNT(v.id) AS total_videojuegos
FROM usuarios AS u
LEFT JOIN videojuegos AS v
    ON u.id = v.usuario_id
GROUP BY u.id, u.nombre
ORDER BY total_videojuegos DESC;

SELECT
    u.nombre AS usuario,
    v.titulo AS videojuego,
    v.puntaje
FROM usuarios AS u
INNER JOIN videojuegos AS v
    ON u.id = v.usuario_id
ORDER BY v.puntaje DESC
LIMIT 1;

SELECT
    u.nombre AS usuario,
    COUNT(v.id) AS total_videojuegos,
    ROUND(AVG(v.puntaje), 2) AS promedio_puntaje
FROM usuarios AS u
INNER JOIN videojuegos AS v
    ON u.id = v.usuario_id
GROUP BY u.id, u.nombre
ORDER BY promedio_puntaje DESC;