USE campuslands_mysql;

-- ==========================================
-- SECCIÓN DE PRÁCTICA DE UPDATE
-- ==========================================

-- 1. Actualizar el costo estimado de un proyecto específico por ID
UPDATE basico_ejercicio_023 
SET costo_estimado = 165000.00 
WHERE id = 1;

-- 2. Cambiar el estado de los proyectos en 'revision' a 'activo' masivamente
UPDATE basico_ejercicio_023 
SET estado = 'activo' 
WHERE estado = 'revision';

-- ==========================================
-- SECCIÓN DE CONSULTAS (Mínimo 5 requeridas)
-- ==========================================

-- 1. Ranking de proyectos activos ordenados por costo de mayor a menor
SELECT nombre_proyecto, categoria, costo_estimado 
FROM basico_ejercicio_023 
WHERE estado = 'activo'
ORDER BY costo_estimado DESC;

-- 2. Resumen financiero por categoría: Total de proyectos y costo promedio
SELECT categoria, COUNT(*) AS total_proyectos, AVG(costo_estimado) AS costo_promedio
FROM basico_ejercicio_023
GROUP BY categoria
ORDER BY costo_promedio DESC;

-- 3. Proyectos inactivos o completados ordenados por fecha de creación
SELECT nombre_proyecto, estado, creado_en 
FROM basico_ejercicio_023 
WHERE estado IN ('inactivo', 'completado')
ORDER BY creado_en ASC;

-- 4. Top 3 proyectos más costosos sin importar su estado
SELECT nombre_proyecto, categoria, costo_estimado 
FROM basico_ejercicio_023 
ORDER BY costo_estimado DESC 
LIMIT 3;

-- 5. Listado general organizado alfabéticamente por el nombre del proyecto
SELECT nombre_proyecto, categoria, costo_estimado, estado 
FROM basico_ejercicio_023 
ORDER BY nombre_proyecto ASC;