USE campuslands_mysql;

-- 1. Consultar todos los personajes activos.
SELECT
    id_personaje,
    nombre,
    clase,
    nivel,
    puntos_vida,
    estado
FROM personajes_rpg
WHERE estado = 'activo'
ORDER BY nivel DESC;


-- 2. Consultar personajes con nivel igual o superior a 30.
SELECT
    nombre,
    clase,
    nivel,
    experiencia
FROM personajes_rpg
WHERE nivel >= 30
ORDER BY nivel DESC;


-- 3. Consultar personajes con más de 2000 puntos de vida.
SELECT
    nombre,
    clase,
    puntos_vida,
    nivel
FROM personajes_rpg
WHERE puntos_vida > 2000
ORDER BY puntos_vida DESC;


-- 4. Obtener el Top 5 de personajes con mayor experiencia.
SELECT
    nombre,
    clase,
    nivel,
    experiencia
FROM personajes_rpg
ORDER BY experiencia DESC
LIMIT 5;


-- 5. Cantidad de personajes y experiencia total por clase.
SELECT
    clase,
    COUNT(*) AS total_personajes,
    SUM(experiencia) AS experiencia_total
FROM personajes_rpg
GROUP BY clase
ORDER BY experiencia_total DESC;