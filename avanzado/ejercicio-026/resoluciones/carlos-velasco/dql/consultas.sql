-- ============================================================
-- Ejercicio 026 - Consultas con CTE
-- ============================================================

USE campuslands_mysql;


-- ============================================================
-- CONSULTA 1
-- CTE para calcular el promedio de nivel por clase.
-- ============================================================

WITH promedio_clase AS (
    SELECT
        c.id_clase,
        c.nombre AS clase,
        c.rol,
        AVG(p.nivel) AS nivel_promedio
    FROM clases AS c
    INNER JOIN personajes AS p
        ON p.id_clase = c.id_clase
    GROUP BY
        c.id_clase,
        c.nombre,
        c.rol
)
SELECT
    clase,
    rol,
    ROUND(nivel_promedio, 2) AS nivel_promedio
FROM promedio_clase
ORDER BY nivel_promedio DESC;


-- ============================================================
-- CONSULTA 2
-- CTE para obtener experiencia total de personajes activos.
-- ============================================================

WITH personajes_activos AS (
    SELECT
        id_personaje,
        nombre,
        nivel,
        experiencia,
        oro
    FROM personajes
    WHERE estado = 'activo'
)
SELECT
    nombre,
    nivel,
    experiencia,
    oro
FROM personajes_activos
WHERE experiencia >= 20000
ORDER BY experiencia DESC;


-- ============================================================
-- CONSULTA 3
-- CTE para calcular misiones completadas por personaje.
-- ============================================================

WITH misiones_completadas AS (
    SELECT
        p.id_personaje,
        p.nombre,
        COUNT(pm.id_mision) AS total_completadas
    FROM personajes AS p
    INNER JOIN personajes_misiones AS pm
        ON pm.id_personaje = p.id_personaje
    WHERE pm.resultado = 'completada'
    GROUP BY
        p.id_personaje,
        p.nombre
)
SELECT
    nombre,
    total_completadas
FROM misiones_completadas
ORDER BY total_completadas DESC;


-- ============================================================
-- CONSULTA 4
-- CTE para calcular recompensas obtenidas.
-- ============================================================

WITH recompensas AS (
    SELECT
        p.id_personaje,
        p.nombre,
        SUM(m.experiencia_recompensa) AS experiencia_misiones,
        SUM(m.oro_recompensa) AS oro_misiones
    FROM personajes AS p
    INNER JOIN personajes_misiones AS pm
        ON pm.id_personaje = p.id_personaje
    INNER JOIN misiones AS m
        ON m.id_mision = pm.id_mision
    WHERE pm.resultado = 'completada'
    GROUP BY
        p.id_personaje,
        p.nombre
)
SELECT
    nombre,
    experiencia_misiones,
    oro_misiones
FROM recompensas
ORDER BY experiencia_misiones DESC;


-- ============================================================
-- CONSULTA 5
-- CTE para obtener los personajes con nivel superior
-- al promedio general.
-- ============================================================

WITH promedio_nivel AS (
    SELECT
        AVG(nivel) AS nivel_promedio
    FROM personajes
),
personajes_sobre_promedio AS (
    SELECT
        p.nombre,
        p.nivel,
        p.experiencia
    FROM personajes AS p
    CROSS JOIN promedio_nivel AS pn
    WHERE p.nivel > pn.nivel_promedio
)
SELECT
    nombre,
    nivel,
    experiencia
FROM personajes_sobre_promedio
ORDER BY nivel DESC;


-- ============================================================
-- CONSULTA 6
-- CTE para ranking de personajes por experiencia.
-- ============================================================

WITH ranking_experiencia AS (
    SELECT
        p.nombre,
        c.nombre AS clase,
        p.nivel,
        p.experiencia,
        RANK() OVER (
            ORDER BY p.experiencia DESC
        ) AS posicion
    FROM personajes AS p
    INNER JOIN clases AS c
        ON c.id_clase = p.id_clase
)
SELECT
    posicion,
    nombre,
    clase,
    nivel,
    experiencia
FROM ranking_experiencia
WHERE posicion <= 5
ORDER BY posicion;


-- ============================================================
-- CONSULTA 7
-- CTE para determinar el porcentaje de éxito de cada personaje.
-- ============================================================

WITH estadisticas AS (
    SELECT
        p.id_personaje,
        p.nombre,
        COUNT(pm.id_mision) AS total_misiones,
        SUM(
            CASE
                WHEN pm.resultado = 'completada' THEN 1
                ELSE 0
            END
        ) AS misiones_completadas
    FROM personajes AS p
    LEFT JOIN personajes_misiones AS pm
        ON pm.id_personaje = p.id_personaje
    GROUP BY
        p.id_personaje,
        p.nombre
)
SELECT
    nombre,
    total_misiones,
    misiones_completadas,
    ROUND(
        misiones_completadas * 100.0
        / NULLIF(total_misiones, 0),
        2
    ) AS porcentaje_exito
FROM estadisticas
WHERE total_misiones > 0
ORDER BY porcentaje_exito DESC;


-- ============================================================
-- CONSULTA 8
-- CTE para obtener un resumen general del RPG.
-- ============================================================

WITH resumen_personajes AS (
    SELECT
        COUNT(*) AS total_personajes,
        SUM(CASE WHEN estado = 'activo' THEN 1 ELSE 0 END)
            AS personajes_activos,
        AVG(nivel) AS nivel_promedio,
        SUM(experiencia) AS experiencia_total,
        SUM(oro) AS oro_total
    FROM personajes
),
resumen_misiones AS (
    SELECT
        COUNT(*) AS total_misiones,
        SUM(
            CASE
                WHEN resultado = 'completada' THEN 1
                ELSE 0
            END
        ) AS misiones_completadas
    FROM personajes_misiones
)
SELECT
    rp.total_personajes,
    rp.personajes_activos,
    ROUND(rp.nivel_promedio, 2) AS nivel_promedio,
    rp.experiencia_total,
    rp.oro_total,
    rm.total_misiones AS participaciones_misiones,
    rm.misiones_completadas
FROM resumen_personajes AS rp
CROSS JOIN resumen_misiones AS rm;