USE campuslands_mysql;

-- 1. Consultar todos los personajes activos.
SELECT
    id_personaje,
    nombre,
    clase,
    nivel,
    puntos_vida,
    puntos_mana,
    experiencia
FROM personajes_rpg
WHERE estado = 'activo'
ORDER BY nivel DESC;


-- 2. Consultar personajes de nivel igual o superior a 50.
SELECT
    nombre,
    clase,
    nivel,
    puntos_vida
FROM personajes_rpg
WHERE nivel >= 50
ORDER BY nivel DESC;


-- 3. Consultar personajes con más de 2500 puntos de vida.
SELECT
    nombre,
    clase,
    nivel,
    puntos_vida
FROM personajes_rpg
WHERE puntos_vida > 2500
ORDER BY puntos_vida DESC;


-- 4. Contar personajes por clase.
SELECT
    clase,
    COUNT(*) AS total_personajes
FROM personajes_rpg
GROUP BY clase
ORDER BY total_personajes DESC;


-- 5. Obtener el nivel promedio por clase.
SELECT
    clase,
    COUNT(*) AS total_personajes,
    ROUND(AVG(nivel), 2) AS nivel_promedio
FROM personajes_rpg
GROUP BY clase
ORDER BY nivel_promedio DESC;


-- 6. Obtener los personajes con mayor experiencia.
SELECT
    nombre,
    clase,
    nivel,
    experiencia
FROM personajes_rpg
ORDER BY experiencia DESC
LIMIT 5;


-- 7. Obtener estadísticas generales de los personajes.
SELECT
    COUNT(*) AS total_personajes,
    MIN(nivel) AS nivel_minimo,
    MAX(nivel) AS nivel_maximo,
    ROUND(AVG(nivel), 2) AS nivel_promedio,
    SUM(puntos_vida) AS vida_total
FROM personajes_rpg;