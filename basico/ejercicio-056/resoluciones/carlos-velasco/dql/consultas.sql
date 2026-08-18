USE campuslands_mysql;

-- 1. Listar todos los personajes activos.
SELECT
    id_personaje,
    nombre,
    clase,
    nivel,
    puntos_vida,
    experiencia
FROM personajes_rpg
WHERE estado = 'activo'
ORDER BY nivel DESC;


-- 2. Mostrar personajes de nivel 50 o superior.
SELECT
    nombre,
    clase,
    nivel,
    puntos_vida
FROM personajes_rpg
WHERE nivel >= 50
ORDER BY nivel DESC;


-- 3. Obtener los personajes con más de 2000 puntos de vida.
SELECT
    nombre,
    clase,
    puntos_vida
FROM personajes_rpg
WHERE puntos_vida > 2000
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


-- 6. Obtener el personaje con mayor experiencia.
SELECT
    nombre,
    clase,
    nivel,
    experiencia
FROM personajes_rpg
ORDER BY experiencia DESC
LIMIT 1;


-- 7. Calcular la vida total de los personajes activos.
SELECT
    COUNT(*) AS personajes_activos,
    SUM(puntos_vida) AS vida_total
FROM personajes_rpg
WHERE estado = 'activo';