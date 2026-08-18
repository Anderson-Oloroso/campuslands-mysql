USE campuslands_mysql;

SELECT
    id_personaje,
    nombre,
    clase,
    nivel,
    puntos_vida
FROM personajes_rpg
WHERE estado = 'activo';


SELECT
    nombre,
    clase,
    nivel
FROM personajes_rpg
WHERE nivel >= 20
ORDER BY nivel DESC;

SELECT
    nombre,
    clase,
    puntos_vida
FROM personajes_rpg
WHERE puntos_vida > 700
ORDER BY puntos_vida DESC;

SELECT
    nombre,
    nivel,
    puntos_vida
FROM personajes_rpg
WHERE clase = 'Guerrero'
ORDER BY nivel DESC;


SELECT
    AVG(puntos_vida) AS promedio_puntos_vida
FROM personajes_rpg
WHERE estado = 'activo';

SELECT
    clase,
    COUNT(*) AS total_personajes
FROM personajes_rpg
GROUP BY clase
ORDER BY total_personajes DESC;

SELECT
    nombre,
    clase,
    nivel,
    puntos_vida
FROM personajes_rpg
ORDER BY nivel DESC
LIMIT 1;