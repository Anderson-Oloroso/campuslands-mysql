-- DQL: Consultas apoyadas en la tabla principal y en las vistas creadas
USE campuslands_mysql;

-- 1. Consulta directa a la vista de personajes activos ordenada por nivel de poder
SELECT 
    nombre,
    faccion,
    rol,
    nivel_poder,
    planeta_origen
FROM vista_personajes_activos
ORDER BY nivel_poder DESC;

-- 2. Consulta a la vista analítica de facciones filtrando aquellas con un poder promedio superior a 85
SELECT 
    faccion,
    total_miembros,
    poder_promedio,
    poder_maximo
FROM vista_resumen_facciones
WHERE poder_promedio > 85.0
ORDER BY poder_promedio DESC;

-- 3. Filtrado desde la vista de activos por planeta de origen específico
SELECT 
    nombre,
    rol,
    faccion,
    planeta_origen
FROM vista_personajes_activos
WHERE planeta_origen IN ('Tatooine', 'Tierra');

-- 4. Conteo de personajes por estado actual
SELECT 
    estado,
    COUNT(*) AS cantidad_personajes
FROM personajes_scifi
GROUP BY estado
ORDER BY cantidad_personajes DESC;

-- 5. Top 3 de personajes activos con mayor poder de combate
SELECT 
    nombre,
    faccion,
    nivel_poder
FROM vista_personajes_activos
ORDER BY nivel_poder DESC
LIMIT 3;
