USE campuslands_mysql;

-- 1. Reporte de balance de clases: Conteo y promedio de nivel por tipo de clase
SELECT 
    clase_personaje,
    COUNT(*) AS cantidad_personajes,
    AVG(nivel_actual) AS nivel_promedio
FROM personajes_rpg
GROUP BY clase_personaje;

-- 2. Identificación de personajes de alto riesgo (Nivel > 80 y estado activo)
SELECT 
    nombre_personaje,
    clase_personaje,
    nivel_actual,
    fuerza_ataque
FROM personajes_rpg
WHERE nivel_actual > 80 AND estado_juego = 'activo'
ORDER BY nivel_actual DESC;

-- 3. Análisis de poder ofensivo por clase (Suma de fuerza de ataque)
SELECT 
    clase_personaje,
    SUM(fuerza_ataque) AS total_poder_clase
FROM personajes_rpg
GROUP BY clase_personaje
ORDER BY total_poder_clase DESC;

-- 4. Ranking de personajes más poderosos (Top 5 por vida y fuerza)
SELECT 
    nombre_personaje,
    puntos_vida,
    fuerza_ataque,
    (puntos_vida + fuerza_ataque) AS poder_total
FROM personajes_rpg
WHERE estado_juego = 'activo'
ORDER BY poder_total DESC
LIMIT 5;

-- 5. Evaluación de salud promedio según clase para detectar desbalances
SELECT 
    clase_personaje,
    ROUND(AVG(puntos_vida), 1) AS vida_promedio
FROM personajes_rpg
GROUP BY clase_personaje
HAVING vida_promedio > 500.0;