-- Consultas Avanzadas para Ejercicio 027 - window functions para videojuego de accion y aventura
-- Concepto principal: window functions
USE campuslands_mysql;

-- 1. Consulta con Funciones de Ventana (Window Functions)
SELECT 
    s.nombre_artefacto AS nombre_elemento,
    p.nombre_reino AS grupo_principal,
    s.poder_ataque AS valor_metrica,
    ROW_NUMBER() OVER (PARTITION BY p.id_reino ORDER BY s.poder_ataque DESC) AS fila_en_grupo,
    RANK() OVER (ORDER BY s.poder_ataque DESC) AS ranking_global,
    DENSE_RANK() OVER (ORDER BY s.poder_ataque DESC) AS dense_ranking_global,
    AVG(s.poder_ataque) OVER (PARTITION BY p.id_reino) AS promedio_del_grupo
FROM artefactos_magicos s
INNER JOIN reinos_aventura p ON s.id_reino = p.id_reino
ORDER BY s.poder_ataque DESC;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre_reino AS categoria_principal,
    COUNT(s.id_artefacto) AS cantidad_registros,
    AVG(s.poder_ataque) AS promedio_categoria,
    (AVG(s.poder_ataque) - (SELECT AVG(poder_ataque) FROM artefactos_magicos)) AS diferencia_vs_global
FROM reinos_aventura p
INNER JOIN artefactos_magicos s ON p.id_reino = s.id_reino
GROUP BY p.id_reino, p.nombre_reino
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.nombre_artefacto AS nombre_destacado,
    p.nombre_reino AS origen,
    s.poder_ataque AS metrica_maxima
FROM artefactos_magicos s
INNER JOIN reinos_aventura p ON s.id_reino = p.id_reino
ORDER BY s.poder_ataque DESC
LIMIT 3;
