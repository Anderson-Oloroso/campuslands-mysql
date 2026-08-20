USE campuslands_mysql;

-- ==========================================
-- SECCIÓN DE PRÁCTICA DE DELETE CONTROLADO
-- ==========================================

-- 1. Eliminación controlada de registros obsoletos usando una condición estricta
DELETE FROM basico_ejercicio_024 
WHERE estado = 'obsoleto' AND stock_material_kg < 50.00;

-- 2. Eliminación de un registro específico por su llave primaria (ID)
DELETE FROM basico_ejercicio_024 
WHERE id = 4;


-- ==========================================
-- SECCIÓN DE CONSULTAS (Mínimo 5 requeridas)
-- ==========================================

-- 1. Ranking de procesos activos ordenados por stock de material de mayor a menor
SELECT nombre_proceso, metodo, stock_material_kg 
FROM basico_ejercicio_024 
WHERE estado = 'activo'
ORDER BY stock_material_kg DESC;

-- 2. Resumen por método de soldadura: Total de procesos y promedio de stock de material
SELECT metodo, COUNT(*) AS total_procesos, AVG(stock_material_kg) AS promedio_stock_kg
FROM basico_ejercicio_024
GROUP BY metodo
ORDER BY promedio_stock_kg DESC;

-- 3. Procesos en revisión ordenados por fecha de creación (más antiguos primero)
SELECT nombre_proceso, metodo, creado_en 
FROM basico_ejercicio_024 
WHERE estado = 'revision'
ORDER BY creado_en ASC;

-- 4. Top 3 procesos con mayor stock de material sin importar su estado
SELECT nombre_proceso, metodo, stock_material_kg 
FROM basico_ejercicio_024 
ORDER BY stock_material_kg DESC 
LIMIT 3;

-- 5. Listado general organizado alfabéticamente por nombre del proceso
SELECT nombre_proceso, metodo, stock_material_kg, estado 
FROM basico_ejercicio_024 
ORDER BY nombre_proceso ASC;