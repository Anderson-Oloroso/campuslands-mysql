USE campuslands_mysql;

-- ==========================================
-- SECCIÓN DE CONSULTAS CON CTE (Common Table Expressions)
-- ==========================================

-- 1. CTE para filtrar personajes activos y calcular cuáles superan el nivel promedio general de los activos
WITH PromedioActivos AS (
    SELECT AVG(nivel) AS nivel_medio FROM personajes_rpg_avanzado WHERE estado = 'activo'
)
SELECT p.nombre_personaje, p.clase, p.nivel, p.experiencia
FROM personajes_rpg_avanzado p, PromedioActivos pa
WHERE p.estado = 'activo' AND p.nivel > pa.nivel_medio
ORDER BY p.nivel DESC;

-- 2. CTE analítica para obtener el resumen de rendimiento por clase y filtrar aquellas con experiencia total superior a 5000
WITH ResumenClase AS (
    SELECT clase, COUNT(*) AS total_miembros, SUM(experiencia) AS exp_total, AVG(puntos_vida) AS vida_promedio
    FROM personajes_rpg_avanzado
    GROUP BY clase
)
SELECT clase, total_miembros, exp_total, vida_promedio
FROM ResumenClase
WHERE exp_total > 5000.00
ORDER BY exp_total DESC;

-- 3. CTE con función de ventana (RANK) para obtener el Top 2 de personajes con mayor experiencia por cada clase
WITH RankingClase AS (
    SELECT nombre_personaje, clase, experiencia,
           ROW_NUMBER() OVER(PARTITION BY clase ORDER BY experiencia DESC) as ranking
    FROM personajes_rpg_avanzado
)
SELECT nombre_personaje, clase, experiencia
FROM RankingClase
WHERE ranking <= 2
ORDER BY experiencia DESC;

-- 4. CTE para identificar personajes inactivos o baneados con más de 10 niveles
WITH InactivosVeteranos AS (
    SELECT nombre_personaje, clase, nivel, estado, creado_en
    FROM personajes_rpg_avanzado
    WHERE estado IN ('inactivo', 'baneado') AND nivel >= 10
)
SELECT nombre_personaje, clase, nivel, estado, creado_en
FROM InactivosVeteranos
ORDER BY nivel DESC;

-- 5. CTE multipropósito para calcular el promedio general de vida y listar personajes que lo superan
WITH VidaGlobal AS (
    SELECT AVG(puntos_vida) AS media_vida FROM personajes_rpg_avanzado
)
SELECT p.nombre_personaje, p.clase, p.puntos_vida, vg.media_vida AS vida_promedio_sistema
FROM personajes_rpg_avanzado p, VidaGlobal vg
WHERE p.puntos_vida > vg.media_vida
ORDER BY p.puntos_vida DESC;