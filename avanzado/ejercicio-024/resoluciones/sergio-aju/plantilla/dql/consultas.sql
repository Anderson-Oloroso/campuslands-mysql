USE campuslands_mysql;

-- ==========================================
-- SECCIÓN DE PRÁCTICA DE BLOQUEOS (LOCKS)
-- ==========================================

-- Ejemplo 1: Bloqueo exclusivo de lectura/escritura en la tabla para mantenimiento concurrente
-- LOCK TABLES procesos_soldadura WRITE;
-- UNLOCK TABLES;

-- Ejemplo 2: Bloqueo de filas específicas mediante transacción para actualización segura (Pessimistic Locking)
START TRANSACTION;
SELECT * FROM procesos_soldadura WHERE id = 1 FOR UPDATE;
-- Simulación de operación crítica de inventario
UPDATE procesos_soldadura SET stock_material_kg = stock_material_kg - 5.00 WHERE id = 1;
COMMIT;


-- ==========================================
-- SECCIÓN DE CONSULTAS DE NEGOCIO (Mínimo 5 requeridas)
-- ==========================================

-- 1. Ranking de procesos activos ordenados por stock de material de mayor a menor
SELECT nombre_proceso, metodo, stock_material_kg 
FROM procesos_soldadura 
WHERE estado = 'activo'
ORDER BY stock_material_kg DESC;

-- 2. Resumen por método de soldadura: Total de procesos y stock promedio de material
SELECT metodo, COUNT(*) AS total_procesos, AVG(stock_material_kg) AS promedio_stock_kg
FROM procesos_soldadura
GROUP BY metodo
ORDER BY promedio_stock_kg DESC;

-- 3. Procesos en mantenimiento o suspendidos ordenados por nombre
SELECT nombre_proceso, metodo, estado, actualizado_en 
FROM procesos_soldadura 
WHERE estado IN ('mantenimiento', 'suspendido')
ORDER BY nombre_proceso ASC;

-- 4. Top 3 procesos con mayor stock de material sin importar su estado
SELECT nombre_proceso, metodo, stock_material_kg 
FROM procesos_soldadura 
ORDER BY stock_material_kg DESC 
LIMIT 3;

-- 5. Listado general organizado alfabéticamente por nombre de proceso
SELECT nombre_proceso, metodo, stock_material_kg, estado 
FROM procesos_soldadura 
ORDER BY nombre_proceso ASC;