-- Consultas Avanzadas para Ejercicio 055 - backup logico para laboratorio de formulas quimicas
-- Concepto principal: backup logico
USE campuslands_mysql;

-- 1. Verificacion de tablas para proceso de Backup Logico
-- Comando sugerido en terminal:
-- mysqldump -u campus -p campuslands_mysql laboratorios_quimicos reactivos_quimicos > backup_lab_quimica.sql

SELECT table_name, table_rows, data_length, index_length 
FROM information_schema.tables 
WHERE table_schema = 'campuslands_mysql' AND table_name IN ('laboratorios_quimicos', 'reactivos_quimicos');

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre_laboratorio AS categoria_principal,
    COUNT(s.id_reactivo) AS cantidad_registros,
    AVG(s.pureza_porcentaje) AS promedio_categoria,
    (AVG(s.pureza_porcentaje) - (SELECT AVG(pureza_porcentaje) FROM reactivos_quimicos)) AS diferencia_vs_global
FROM laboratorios_quimicos p
INNER JOIN reactivos_quimicos s ON p.id_laboratorio = s.id_laboratorio
GROUP BY p.id_laboratorio, p.nombre_laboratorio
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.nombre_quimico AS nombre_destacado,
    p.nombre_laboratorio AS origen,
    s.pureza_porcentaje AS metrica_maxima
FROM reactivos_quimicos s
INNER JOIN laboratorios_quimicos p ON s.id_laboratorio = p.id_laboratorio
ORDER BY s.pureza_porcentaje DESC
LIMIT 3;
