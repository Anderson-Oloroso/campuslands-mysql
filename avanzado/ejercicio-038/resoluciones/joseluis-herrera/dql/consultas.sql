USE campuslands_mysql;

SELECT
    id_jugador,
    CONCAT(nombre, ' ', apellido) AS jugador,
    posicion,
    goles,
    estado
FROM jugadores
WHERE estado = 'activo'
ORDER BY goles DESC;

SELECT
    posicion,
    COUNT(*) AS total_jugadores,
    AVG(goles) AS promedio_goles
FROM jugadores
GROUP BY posicion
ORDER BY promedio_goles DESC;

SELECT
    CONCAT(nombre, ' ', apellido) AS jugador,
    posicion,
    goles
FROM jugadores
WHERE goles >= 10
ORDER BY goles DESC;

SELECT
    estado,
    COUNT(*) AS total_jugadores,
    AVG(edad) AS edad_promedio
FROM jugadores
GROUP BY estado
ORDER BY total_jugadores DESC;