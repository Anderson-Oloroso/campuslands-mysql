USE campuslands_mysql;

-- 1. Consultar todos los personajes registrados.
SELECT
    id_personaje,
    nombre,
    clase,
    nivel,
    vida,
    ataque,
    defensa,
    oro,
    estado
FROM personajes_aventura
ORDER BY nivel DESC;


-- 2. Consultar los personajes activos con nivel superior a 30.
SELECT
    nombre AS personaje,
    clase,
    nivel,
    ataque,
    defensa
FROM personajes_aventura
WHERE estado = 'activo'
  AND nivel > 30
ORDER BY nivel DESC;


-- 3. Obtener los 5 personajes con mayor ataque.
SELECT
    nombre AS personaje,
    clase,
    nivel,
    ataque
FROM personajes_aventura
ORDER BY ataque DESC
LIMIT 5;


-- 4. Consultar los personajes con más de 5000 puntos de vida.
SELECT
    nombre AS personaje,
    clase,
    nivel,
    vida
FROM personajes_aventura
WHERE vida > 5000
ORDER BY vida DESC;


-- 5. Obtener cantidad de personajes y promedio de nivel por clase.
SELECT
    clase,
    COUNT(*) AS total_personajes,
    ROUND(AVG(nivel), 2) AS nivel_promedio
FROM personajes_aventura
GROUP BY clase
ORDER BY nivel_promedio DESC;