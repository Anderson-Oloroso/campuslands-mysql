USE campuslands_mysql;

-- 1. Listar todos los personajes activos.
SELECT
    id_personaje,
    nombre,
    clase,
    nivel,
    puntos_vida,
    poder_ataque,
    experiencia
FROM personajes
WHERE estado = 'activo'
ORDER BY nivel DESC;


-- 2. Mostrar personajes con nivel 50 o superior.
SELECT
    nombre,
    clase,
    nivel,
    poder_ataque
FROM personajes
WHERE nivel >= 50
ORDER BY nivel DESC;


-- 3. Mostrar los personajes con mayor poder de ataque.
SELECT
    nombre,
    clase,
    nivel,
    poder_ataque
FROM personajes
ORDER BY poder_ataque DESC
LIMIT 5;


-- 4. Contar personajes por clase.
SELECT
    clase,
    COUNT(*) AS total_personajes
FROM personajes
GROUP BY clase
ORDER BY total_personajes DESC;


-- 5. Obtener el nivel promedio por clase.
SELECT
    clase,
    COUNT(*) AS total_personajes,
    ROUND(AVG(nivel), 2) AS nivel_promedio
FROM personajes
GROUP BY clase
ORDER BY nivel_promedio DESC;


-- 6. Obtener los personajes con más de 2500 puntos de vida.
SELECT
    nombre,
    clase,
    nivel,
    puntos_vida
FROM personajes
WHERE puntos_vida > 2500
ORDER BY puntos_vida DESC;


-- 7. Obtener estadísticas generales de los personajes activos.
SELECT
    COUNT(*) AS total_activos,
    SUM(puntos_vida) AS vida_total,
    ROUND(AVG(poder_ataque), 2) AS ataque_promedio,
    MAX(nivel) AS nivel_maximo
FROM personajes
WHERE estado = 'activo';