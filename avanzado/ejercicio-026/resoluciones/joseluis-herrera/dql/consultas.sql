USE campuslands_mysql;

WITH personajes_activos AS (
    SELECT nombre, clase, nivel
    FROM personajes_rpg
    WHERE estado = 'activo'
)
SELECT *
FROM personajes_activos
ORDER BY nivel DESC;

WITH alto_nivel AS (
    SELECT *
    FROM personajes_rpg
    WHERE nivel >= 20
)
SELECT
    nombre,
    clase,
    nivel,
    oro
FROM alto_nivel
ORDER BY nivel DESC;


WITH promedio_clase AS (
    SELECT
        clase,
        AVG(nivel) AS promedio_nivel
    FROM personajes_rpg
    GROUP BY clase
)
SELECT *
FROM promedio_clase
ORDER BY promedio_nivel DESC;


WITH ranking_oro AS (
    SELECT
        nombre,
        clase,
        oro
    FROM personajes_rpg
)
SELECT *
FROM ranking_oro
ORDER BY oro DESC
LIMIT 5;

WITH promedio_vida AS (
    SELECT AVG(puntos_vida) AS vida_promedio
    FROM personajes_rpg
)
SELECT
    p.nombre,
    p.clase,
    p.puntos_vida
FROM personajes_rpg AS p
CROSS JOIN promedio_vida AS pv
WHERE p.puntos_vida > pv.vida_promedio
ORDER BY p.puntos_vida DESC;

WITH activos AS (
    SELECT *
    FROM personajes_rpg
    WHERE estado = 'activo'
)
SELECT
    COUNT(*) AS total_activos,
    AVG(nivel) AS promedio_nivel,
    SUM(oro) AS oro_total
FROM activos;

WITH conteo_clases AS (
    SELECT
        clase,
        COUNT(*) AS total_personajes
    FROM personajes_rpg
    GROUP BY clase
)
SELECT *
FROM conteo_clases
ORDER BY total_personajes DESC
LIMIT 1;