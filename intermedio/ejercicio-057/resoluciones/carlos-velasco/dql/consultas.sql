USE campuslands_mysql;

-- 1. Reporte general de personajes activos.
SELECT
    p.nombre AS personaje,
    p.clase AS clase,
    p.nivel AS nivel,
    p.puntos_vida AS puntos_vida,
    p.poder_ataque AS poder_ataque
FROM personajes AS p
WHERE p.estado = 'activo'
ORDER BY p.nivel DESC;


-- 2. Reporte de cantidad de personajes por clase.
SELECT
    p.clase AS clase,
    COUNT(*) AS total_personajes
FROM personajes AS p
GROUP BY p.clase
ORDER BY total_personajes DESC;


-- 3. Reporte estadístico por clase.
SELECT
    p.clase AS clase,
    COUNT(*) AS total_personajes,
    ROUND(AVG(p.nivel), 2) AS nivel_promedio,
    ROUND(AVG(p.poder_ataque), 2) AS ataque_promedio,
    SUM(p.puntos_vida) AS vida_total
FROM personajes AS p
GROUP BY p.clase
ORDER BY nivel_promedio DESC;


-- 4. Clases con promedio de nivel superior a 40.
SELECT
    p.clase AS clase,
    COUNT(*) AS total_personajes,
    ROUND(AVG(p.nivel), 2) AS nivel_promedio
FROM personajes AS p
GROUP BY p.clase
HAVING AVG(p.nivel) > 40
ORDER BY nivel_promedio DESC;


-- 5. Top 5 personajes por experiencia.
SELECT
    p.nombre AS personaje,
    p.clase AS clase,
    p.nivel AS nivel,
    p.experiencia AS experiencia
FROM personajes AS p
ORDER BY p.experiencia DESC
LIMIT 5;


-- 6. Reporte de personajes con alto poder de ataque.
SELECT
    p.nombre AS personaje,
    p.clase AS clase,
    p.nivel AS nivel,
    p.poder_ataque AS poder_ataque,
    p.estado AS estado
FROM personajes AS p
WHERE p.poder_ataque >= 900
ORDER BY p.poder_ataque DESC;


-- 7. Resumen general de personajes activos.
SELECT
    COUNT(*) AS total_activos,
    SUM(p.puntos_vida) AS vida_total,
    SUM(p.experiencia) AS experiencia_total,
    ROUND(AVG(p.nivel), 2) AS nivel_promedio,
    ROUND(AVG(p.poder_ataque), 2) AS ataque_promedio
FROM personajes AS p
WHERE p.estado = 'activo';