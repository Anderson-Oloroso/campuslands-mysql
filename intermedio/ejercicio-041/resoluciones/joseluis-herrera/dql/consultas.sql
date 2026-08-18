USE campuslands_mysql;

SELECT
    id_jugador,
    CONCAT(nombre, ' ', apellido) AS jugador,
    categoria,
    edad,
    ranking,
    partidos_ganados,
    partidos_perdidos,
    estado
FROM jugadores
ORDER BY ranking;

SELECT
    CONCAT(nombre, ' ', apellido) AS jugador,
    edad,
    categoria
FROM jugadores
WHERE edad BETWEEN 18 AND 40
ORDER BY edad;

SELECT
    categoria,
    COUNT(*) AS total_jugadores,
    AVG(edad) AS edad_promedio
FROM jugadores
GROUP BY categoria
ORDER BY edad_promedio DESC;

SELECT
    CONCAT(nombre, ' ', apellido) AS jugador,
    partidos_ganados,
    partidos_perdidos,
    partidos_ganados + partidos_perdidos AS partidos_jugados
FROM jugadores
ORDER BY partidos_jugados DESC;