-- Consultas Avanzadas para Ejercicio 049 - triggers para paracaidismo
-- Concepto principal: triggers
USE campuslands_mysql;

-- 1. Verificacion del log de auditoria generado por triggers
SELECT * FROM log_auditoria_paracaidismo ORDER BY fecha_registro DESC;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre_zona AS categoria_principal,
    COUNT(s.id_salto) AS cantidad_registros,
    AVG(s.altitud_salto_pies) AS promedio_categoria,
    (AVG(s.altitud_salto_pies) - (SELECT AVG(altitud_salto_pies) FROM saltos_registrados)) AS diferencia_vs_global
FROM zonas_salto p
INNER JOIN saltos_registrados s ON p.id_zona = s.id_zona
GROUP BY p.id_zona, p.nombre_zona
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.paracaidista AS nombre_destacado,
    p.nombre_zona AS origen,
    s.altitud_salto_pies AS metrica_maxima
FROM saltos_registrados s
INNER JOIN zonas_salto p ON s.id_zona = p.id_zona
ORDER BY s.altitud_salto_pies DESC
LIMIT 3;
