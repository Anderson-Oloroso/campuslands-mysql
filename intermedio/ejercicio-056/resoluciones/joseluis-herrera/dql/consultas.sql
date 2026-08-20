USE campuslands_mysql;

SELECT
    nombre AS personaje,
    clase,
    nivel,
    puntos_vida AS vida,
    oro
FROM personajes_rpg
WHERE estado = 'activo';

SELECT
    nombre AS personaje,
    clase,
    nivel,
    puntos_vida AS vida
FROM personajes_rpg
WHERE nivel >= 20
ORDER BY nivel DESC;

SELECT
    nombre AS personaje,
    clase,
    oro
FROM personajes_rpg
WHERE oro >= 500
ORDER BY oro DESC;

SELECT
    clase,
    COUNT(*) AS total_personajes,
    AVG(nivel) AS nivel_promedio
FROM personajes_rpg
GROUP BY clase
ORDER BY nivel_promedio DESC;

SELECT
    estado,
    COUNT(*) AS total_personajes,
    SUM(oro) AS oro_total
FROM personajes_rpg
GROUP BY estado
ORDER BY oro_total DESC;