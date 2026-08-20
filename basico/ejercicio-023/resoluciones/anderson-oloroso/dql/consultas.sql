USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por presupuesto_usd descendentemente
SELECT plano_id, nombre_proyecto, tipo_estructura, area_m2, presupuesto_usd, estado
FROM planos_arquitectura
ORDER BY presupuesto_usd DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT plano_id, nombre_proyecto, tipo_estructura, presupuesto_usd
FROM planos_arquitectura
WHERE estado = 'Activo';

-- 3. Agrupar por tipo_estructura y calcular total y promedio de presupuesto_usd
SELECT tipo_estructura, COUNT(*) AS total_registros, AVG(presupuesto_usd) AS promedio_valor
FROM planos_arquitectura
GROUP BY tipo_estructura
ORDER BY promedio_valor DESC;

-- 4. Filtrar por presupuesto_usd mayor a 2000
SELECT plano_id, nombre_proyecto, tipo_estructura, presupuesto_usd
FROM planos_arquitectura
WHERE presupuesto_usd > 2000.00
ORDER BY presupuesto_usd ASC;

-- 5. Seleccionar los 5 mejores registros según presupuesto_usd
SELECT plano_id, nombre_proyecto, tipo_estructura, presupuesto_usd
FROM planos_arquitectura
ORDER BY presupuesto_usd DESC
LIMIT 5;
