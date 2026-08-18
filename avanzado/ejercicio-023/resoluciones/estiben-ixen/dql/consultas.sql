-- Consultas Avanzadas para Ejercicio 023 - roles y permisos para arquitectura 3D
-- Concepto principal: roles y permisos
USE campuslands_mysql;

-- 1. Creacion y asignacion de roles y privilegios
CREATE ROLE IF NOT EXISTS rol_analista_arquitectura_3d;
GRANT SELECT ON campuslands_mysql.firmas_arquitectura TO rol_analista_arquitectura_3d;
GRANT SELECT ON campuslands_mysql.proyectos_bim TO rol_analista_arquitectura_3d;

CREATE USER IF NOT EXISTS 'auditor_arquitectura_3d'@'localhost' IDENTIFIED BY 'AuditorPass123!';
GRANT rol_analista_arquitectura_3d TO 'auditor_arquitectura_3d'@'localhost';
SET DEFAULT ROLE rol_analista_arquitectura_3d TO 'auditor_arquitectura_3d'@'localhost';

SHOW GRANTS FOR 'auditor_arquitectura_3d'@'localhost';

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre_firma AS categoria_principal,
    COUNT(s.id_proyecto) AS cantidad_registros,
    AVG(s.area_m2) AS promedio_categoria,
    (AVG(s.area_m2) - (SELECT AVG(area_m2) FROM proyectos_bim)) AS diferencia_vs_global
FROM firmas_arquitectura p
INNER JOIN proyectos_bim s ON p.id_firma = s.id_firma
GROUP BY p.id_firma, p.nombre_firma
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.nombre_obra AS nombre_destacado,
    p.nombre_firma AS origen,
    s.area_m2 AS metrica_maxima
FROM proyectos_bim s
INNER JOIN firmas_arquitectura p ON s.id_firma = p.id_firma
ORDER BY s.area_m2 DESC
LIMIT 3;
