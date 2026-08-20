-- Consultas Avanzadas para Ejercicio 028 - JSON en MySQL para academia tech
-- Concepto principal: JSON en MySQL
USE campuslands_mysql;

-- 1. Generacion y consulta de estructuras JSON
SELECT 
    JSON_OBJECT(
        'id', s.id_camper,
        'nombre', s.nombre,
        'metrica', s.promedio_acumulado,
        'categoria', p.nombre_ruta
    ) AS elemento_json
FROM campers_estudiantes s
INNER JOIN rutas_aprendizaje p ON s.id_ruta = p.id_ruta
ORDER BY s.promedio_acumulado DESC;

-- 2. Agregacion de array JSON por grupo
SELECT 
    p.nombre_ruta AS grupo,
    JSON_ARRAYAGG(s.nombre) AS elementos_en_grupo
FROM rutas_aprendizaje p
INNER JOIN campers_estudiantes s ON p.id_ruta = s.id_ruta
GROUP BY p.nombre_ruta;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre_ruta AS categoria_principal,
    COUNT(s.id_camper) AS cantidad_registros,
    AVG(s.promedio_acumulado) AS promedio_categoria,
    (AVG(s.promedio_acumulado) - (SELECT AVG(promedio_acumulado) FROM campers_estudiantes)) AS diferencia_vs_global
FROM rutas_aprendizaje p
INNER JOIN campers_estudiantes s ON p.id_ruta = s.id_ruta
GROUP BY p.id_ruta, p.nombre_ruta
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.nombre AS nombre_destacado,
    p.nombre_ruta AS origen,
    s.promedio_acumulado AS metrica_maxima
FROM campers_estudiantes s
INNER JOIN rutas_aprendizaje p ON s.id_ruta = p.id_ruta
ORDER BY s.promedio_acumulado DESC
LIMIT 3;
