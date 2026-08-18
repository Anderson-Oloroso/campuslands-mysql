-- Consultas Avanzadas para Ejercicio 024 - bloqueos para soldadura
-- Concepto principal: bloqueos
USE campuslands_mysql;

-- 1. Demostracion de Bloqueo Pesimista (FOR UPDATE)
START TRANSACTION;
SELECT * FROM proyectos_soldadura 
WHERE id_proyecto = 1 
FOR UPDATE;
-- El registro queda bloqueado para lectura/escritura concurrente hasta el commit
COMMIT;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre_taller AS categoria_principal,
    COUNT(s.id_proyecto) AS cantidad_registros,
    AVG(s.tipo_material) AS promedio_categoria,
    (AVG(s.tipo_material) - (SELECT AVG(tipo_material) FROM proyectos_soldadura)) AS diferencia_vs_global
FROM talleres_metalmecanicos p
INNER JOIN proyectos_soldadura s ON p.id_taller = s.id_taller
GROUP BY p.id_taller, p.nombre_taller
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.nombre_estructura AS nombre_destacado,
    p.nombre_taller AS origen,
    s.tipo_material AS metrica_maxima
FROM proyectos_soldadura s
INNER JOIN talleres_metalmecanicos p ON s.id_taller = p.id_taller
ORDER BY s.tipo_material DESC
LIMIT 3;
