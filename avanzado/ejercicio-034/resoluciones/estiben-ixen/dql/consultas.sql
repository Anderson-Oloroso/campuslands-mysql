-- Consultas Avanzadas para Ejercicio 034 - triggers para garaje de motos
-- Concepto principal: triggers
USE campuslands_mysql;

-- 1. Verificacion del log de auditoria generado por triggers
SELECT * FROM log_auditoria_garaje_motos ORDER BY fecha_registro DESC;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre AS categoria_principal,
    COUNT(s.id_estacionamiento) AS cantidad_registros,
    AVG(s.id_propietario) AS promedio_categoria,
    (AVG(s.id_propietario) - (SELECT AVG(id_propietario) FROM estacionamiento_motos)) AS diferencia_vs_global
FROM propietarios_motos p
INNER JOIN estacionamiento_motos s ON p.id_propietario = s.modelo
GROUP BY p.id_propietario, p.nombre
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.placa AS nombre_destacado,
    p.nombre AS origen,
    s.id_propietario AS metrica_maxima
FROM estacionamiento_motos s
INNER JOIN propietarios_motos p ON s.modelo = p.id_propietario
ORDER BY s.id_propietario DESC
LIMIT 3;
