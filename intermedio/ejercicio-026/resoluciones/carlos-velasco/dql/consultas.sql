USE campuslands_mysql;


-- 1. Mostrar todos los personajes registrados.
SELECT
    id_personaje,
    nombre_personaje,
    clase,
    nivel,
    puntos_vida,
    puntos_mana,
    fuerza,
    defensa,
    estado
FROM personajes_rpg
ORDER BY nivel DESC;


-- 2. Mostrar los personajes activos de nivel superior a 40.
SELECT
    nombre_personaje,
    clase,
    nivel,
    puntos_vida,
    estado
FROM personajes_rpg
WHERE estado = 'activo'
  AND nivel > 40
ORDER BY nivel DESC;


-- 3. Mostrar los personajes con fuerza igual o superior a 80.
SELECT
    nombre_personaje,
    clase,
    nivel,
    fuerza
FROM personajes_rpg
WHERE fuerza >= 80
ORDER BY fuerza DESC;


-- 4. Mostrar los personajes con más de 2500 puntos de vida.
SELECT
    nombre_personaje,
    clase,
    nivel,
    puntos_vida
FROM personajes_rpg
WHERE puntos_vida > 2500
ORDER BY puntos_vida DESC;


-- 5. Mostrar el top 5 de personajes por nivel.
SELECT
    nombre_personaje,
    clase,
    nivel,
    fuerza,
    defensa
FROM personajes_rpg
ORDER BY nivel DESC
LIMIT 5;


-- 6. Calcular el poder defensivo y ofensivo combinado.
SELECT
    nombre_personaje,
    clase,
    fuerza,
    defensa,
    (fuerza + defensa) AS poder_combate
FROM personajes_rpg
ORDER BY poder_combate DESC;


-- 7. Mostrar el promedio de estadísticas de los personajes activos.
SELECT
    COUNT(*) AS personajes_activos,
    ROUND(AVG(nivel), 2) AS nivel_promedio,
    ROUND(AVG(puntos_vida), 2) AS vida_promedio,
    ROUND(AVG(puntos_mana), 2) AS mana_promedio,
    ROUND(AVG(fuerza), 2) AS fuerza_promedio,
    ROUND(AVG(defensa), 2) AS defensa_promedio
FROM personajes_rpg
WHERE estado = 'activo';