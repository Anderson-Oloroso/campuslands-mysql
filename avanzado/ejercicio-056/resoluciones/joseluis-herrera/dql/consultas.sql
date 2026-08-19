USE campuslands_mysql;

WITH personajes_activos AS (
    SELECT
        id_personaje,
        nombre,
        clase,
        nivel,
        experiencia,
        oro,
        salud,
        ataque
    FROM personajes_rpg
    WHERE estado = 'activo'
)
SELECT
    nombre,
    clase,
    nivel,
    experiencia,
    oro
FROM personajes_activos
ORDER BY nivel DESC, experiencia DESC;

USE campuslands_mysql;

WITH estadisticas_clase AS (
    SELECT
        clase,
        COUNT(*) AS total_personajes,
        ROUND(AVG(nivel), 2) AS nivel_promedio,
        ROUND(AVG(ataque), 2) AS ataque_promedio
    FROM personajes_rpg
    WHERE estado = 'activo'
    GROUP BY clase
)
SELECT
    clase,
    total_personajes,
    nivel_promedio,
    ataque_promedio
FROM estadisticas_clase
ORDER BY ataque_promedio DESC;

USE campuslands_mysql;

WITH ranking_personajes AS (
    SELECT
        nombre,
        clase,
        nivel,
        ataque,
        DENSE_RANK() OVER (
            ORDER BY ataque DESC
        ) AS posicion_ataque
    FROM personajes_rpg
    WHERE estado = 'activo'
)
SELECT
    posicion_ataque,
    nombre,
    clase,
    nivel,
    ataque
FROM ranking_personajes
WHERE posicion_ataque <= 5
ORDER BY posicion_ataque, nombre;