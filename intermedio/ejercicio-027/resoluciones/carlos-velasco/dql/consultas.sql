USE campuslands_mysql;


-- 1. Reporte general de personajes activos.
SELECT
    nombre_personaje AS personaje,
    clase,
    nivel,
    puntos_vida AS vida,
    ataque,
    defensa,
    misiones_completadas AS misiones,
    monedas
FROM personajes_aventura
WHERE estado = 'activo'
ORDER BY nivel DESC;


-- 2. Ranking de personajes por nivel.
SELECT
    nombre_personaje AS personaje,
    clase,
    nivel,
    misiones_completadas AS misiones
FROM personajes_aventura
ORDER BY nivel DESC
LIMIT 5;


-- 3. Ranking de personajes por poder de combate.
SELECT
    nombre_personaje AS personaje,
    clase,
    ataque,
    defensa,
    (ataque + defensa) AS poder_combate
FROM personajes_aventura
ORDER BY poder_combate DESC
LIMIT 5;


-- 4. Reporte de personajes con mayor cantidad de misiones.
SELECT
    nombre_personaje AS personaje,
    clase,
    nivel,
    misiones_completadas AS misiones,
    monedas
FROM personajes_aventura
ORDER BY misiones_completadas DESC
LIMIT 5;


-- 5. Reporte de personajes con más de 3000 monedas.
SELECT
    nombre_personaje AS personaje,
    clase,
    nivel,
    monedas,
    misiones_completadas AS misiones
FROM personajes_aventura
WHERE monedas > 3000
ORDER BY monedas DESC;


-- 6. Indicadores generales de personajes activos.
SELECT
    COUNT(*) AS total_personajes,
    ROUND(AVG(nivel), 2) AS nivel_promedio,
    ROUND(AVG(puntos_vida), 2) AS vida_promedio,
    ROUND(AVG(ataque), 2) AS ataque_promedio,
    ROUND(AVG(defensa), 2) AS defensa_promedio,
    ROUND(SUM(monedas), 2) AS monedas_totales
FROM personajes_aventura
WHERE estado = 'activo';


-- 7. Reporte agrupado por clase.
SELECT
    clase,
    COUNT(*) AS total_personajes,
    ROUND(AVG(nivel), 2) AS nivel_promedio,
    SUM(misiones_completadas) AS misiones_totales,
    ROUND(SUM(monedas), 2) AS monedas_totales
FROM personajes_aventura
GROUP BY clase
ORDER BY total_personajes DESC, nivel_promedio DESC;


-- 8. Personajes cuyo poder de combate supera 1600.
SELECT
    nombre_personaje AS personaje,
    clase,
    nivel,
    ataque,
    defensa,
    (ataque + defensa) AS poder_combate
FROM personajes_aventura
WHERE (ataque + defensa) > 1600
ORDER BY poder_combate DESC;