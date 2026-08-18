-- Consultas Avanzadas para Ejercicio 040 - backup logico para carreras urbanas
-- Concepto principal: backup logico
USE campuslands_mysql;

-- 1. Verificacion de tablas para proceso de Backup Logico
-- Comando sugerido en terminal:
-- mysqldump -u campus -p campuslands_mysql pilotos_urbanos vehiculos_tuning > backup_carreras_urbanas.sql

SELECT table_name, table_rows, data_length, index_length 
FROM information_schema.tables 
WHERE table_schema = 'campuslands_mysql' AND table_name IN ('pilotos_urbanos', 'vehiculos_tuning');

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.apodo AS categoria_principal,
    COUNT(s.id_vehiculo) AS cantidad_registros,
    AVG(s.potencia_hp) AS promedio_categoria,
    (AVG(s.potencia_hp) - (SELECT AVG(potencia_hp) FROM vehiculos_tuning)) AS diferencia_vs_global
FROM pilotos_urbanos p
INNER JOIN vehiculos_tuning s ON p.id_piloto = s.id_piloto
GROUP BY p.id_piloto, p.apodo
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.modelo AS nombre_destacado,
    p.apodo AS origen,
    s.potencia_hp AS metrica_maxima
FROM vehiculos_tuning s
INNER JOIN pilotos_urbanos p ON s.id_piloto = p.id_piloto
ORDER BY s.potencia_hp DESC
LIMIT 3;
