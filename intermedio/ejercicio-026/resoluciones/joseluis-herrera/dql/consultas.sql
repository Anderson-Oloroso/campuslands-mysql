USE campuslands_mysql;

SELECT
    nombre,
    clase,
    nivel,
    puntos_vida
FROM personajes_rpg
WHERE estado = 'activo'
ORDER BY nivel DESC;

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
    oro
FROM personajes_rpg
ORDER BY oro DESC
LIMIT 5;

SELECT
    clase,
    AVG(puntos_vida) AS promedio_vida
FROM personajes_rpg
GROUP BY clase
ORDER BY promedio_vida DESC;

SELECT
    estado,
    COUNT(*) AS total_personajes
FROM personajes_rpg
GROUP BY estado;

SELECT
    nombre,
    clase,
    mana
FROM personajes_rpg
WHERE mana > 500
ORDER BY mana DESC;

SELECT
    nombre,
    clase,
    nivel
FROM personajes_rpg
ORDER BY nivel DESC
LIMIT 1;