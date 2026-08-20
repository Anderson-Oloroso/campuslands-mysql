USE campuslands_mysql;

SELECT
    id_jugador,
    CONCAT(nombre, ' ', apellido) AS jugador,
    categoria,
    edad,
    ranking,
    estado
FROM jugadores
ORDER BY ranking;

SELECT
    CONCAT(nombre, ' ', apellido) AS jugador,
    categoria,
    ranking,
    partidos_ganados
FROM jugadores
WHERE estado = 'activo'
ORDER BY ranking;

SELECT
    categoria,
    COUNT(*) AS total_jugadores,
    AVG(edad) AS edad_promedio
FROM jugadores
GROUP BY categoria
ORDER BY total_jugadores DESC;

SELECT
    CONCAT(nombre, ' ', apellido) AS jugador,
    partidos_ganados,
    partidos_perdidos,
    (partidos_ganados + partidos_perdidos) AS partidos_jugados
FROM jugadores
ORDER BY partidos_ganados DESC;