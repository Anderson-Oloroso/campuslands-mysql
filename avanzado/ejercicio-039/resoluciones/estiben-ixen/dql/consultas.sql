-- Consultas Avanzadas para Ejercicio 039 - bloqueos para kickboxing
-- Concepto principal: bloqueos
USE campuslands_mysql;

-- 1. Demostracion de Bloqueo Pesimista (FOR UPDATE)
START TRANSACTION;
SELECT * FROM peleadores_kb 
WHERE id_peleador = 1 
FOR UPDATE;
-- El registro queda bloqueado para lectura/escritura concurrente hasta el commit
COMMIT;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre AS categoria_principal,
    COUNT(s.id_peleador) AS cantidad_registros,
    AVG(s.id_gimnasio) AS promedio_categoria,
    (AVG(s.id_gimnasio) - (SELECT AVG(id_gimnasio) FROM peleadores_kb)) AS diferencia_vs_global
FROM gimnasios_kb p
INNER JOIN peleadores_kb s ON p.id_gimnasio = s.apodo
GROUP BY p.id_gimnasio, p.nombre
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.nombre AS nombre_destacado,
    p.nombre AS origen,
    s.id_gimnasio AS metrica_maxima
FROM peleadores_kb s
INNER JOIN gimnasios_kb p ON s.apodo = p.id_gimnasio
ORDER BY s.id_gimnasio DESC
LIMIT 3;
