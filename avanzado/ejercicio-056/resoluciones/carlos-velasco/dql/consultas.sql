USE campuslands_mysql;

-- 1. CTE para obtener los personajes activos con sus estadisticas principales.
WITH personajes_activos AS (
    SELECT
        id_personaje,
        nombre,
        clase,
        nivel,
        experiencia,
        ataque,
        defensa
    FROM personajes_rpg
    WHERE estado = 'activo'
)
SELECT
    nombre,
    clase,
    nivel,
    experiencia,
    ataque,
    defensa
FROM personajes_activos
ORDER BY nivel DESC;


-- 2. CTE para calcular el poder total de cada personaje.
WITH poder_personajes AS (
    SELECT
        nombre,
        clase,
        nivel,
        ataque,
        defensa,
        (ataque + defensa) AS poder_total
    FROM personajes_rpg
    WHERE estado = 'activo'
)
SELECT
    nombre,
    clase,
    nivel,
    poder_total
FROM poder_personajes
ORDER BY poder_total DESC;


-- 3. CTE para calcular el promedio de nivel de los personajes activos.
WITH niveles_activos AS (
    SELECT nivel
    FROM personajes_rpg
    WHERE estado = 'activo'
)
SELECT
    COUNT(*) AS total_personajes,
    ROUND(AVG(nivel), 2) AS nivel_promedio,
    MAX(nivel) AS nivel_maximo,
    MIN(nivel) AS nivel_minimo
FROM niveles_activos;


-- 4. CTE para obtener estadisticas por clase.
WITH estadisticas_clase AS (
    SELECT
        clase,
        COUNT(*) AS total_personajes,
        ROUND(AVG(nivel), 2) AS nivel_promedio,
        ROUND(AVG(ataque), 2) AS ataque_promedio,
        ROUND(AVG(defensa), 2) AS defensa_promedio
    FROM personajes_rpg
    WHERE estado = 'activo'
    GROUP BY clase
)
SELECT
    clase,
    total_personajes,
    nivel_promedio,
    ataque_promedio,
    defensa_promedio
FROM estadisticas_clase
ORDER BY nivel_promedio DESC;


-- 5. CTE para identificar personajes cuyo poder esta por encima
-- del promedio de poder de todos los personajes activos.
WITH poderes AS (
    SELECT
        nombre,
        clase,
        nivel,
        (ataque + defensa) AS poder_total
    FROM personajes_rpg
    WHERE estado = 'activo'
),
promedio_poder AS (
    SELECT
        AVG(poder_total) AS poder_promedio
    FROM poderes
)
SELECT
    p.nombre,
    p.clase,
    p.nivel,
    p.poder_total,
    ROUND(pp.poder_promedio, 2) AS poder_promedio
FROM poderes p
CROSS JOIN promedio_poder pp
WHERE p.poder_total > pp.poder_promedio
ORDER BY p.poder_total DESC;


-- 6. CTE para crear un ranking de personajes por poder.
WITH ranking_personajes AS (
    SELECT
        nombre,
        clase,
        nivel,
        (ataque + defensa) AS poder_total,
        ROW_NUMBER() OVER (
            ORDER BY (ataque + defensa) DESC
        ) AS posicion
    FROM personajes_rpg
    WHERE estado = 'activo'
)
SELECT
    posicion,
    nombre,
    clase,
    nivel,
    poder_total
FROM ranking_personajes
WHERE posicion <= 5
ORDER BY posicion;


-- 7. CTE para clasificar personajes según su nivel.
WITH niveles_clasificados AS (
    SELECT
        nombre,
        clase,
        nivel,
        CASE
            WHEN nivel >= 60 THEN 'elite'
            WHEN nivel >= 40 THEN 'avanzado'
            WHEN nivel >= 20 THEN 'intermedio'
            ELSE 'principiante'
        END AS categoria_nivel
    FROM personajes_rpg
    WHERE estado = 'activo'
)
SELECT
    categoria_nivel,
    COUNT(*) AS total_personajes,
    ROUND(AVG(nivel), 2) AS nivel_promedio
FROM niveles_clasificados
GROUP BY categoria_nivel
ORDER BY nivel_promedio DESC;