USE campuslands_mysql;

-- 1. Ranking de procesos activos ordenados por stock de material de mayor a menor con JOINS
SELECT p.nombre_proyecto, m.nombre_metodo AS metodo, t.nombre_tecnico AS responsable, p.stock_material_kg 
FROM procesos_soldadura p
JOIN metodos_soldadura m ON p.metodo_id = m.id
JOIN tecnicos_soldadura t ON p.tecnico_id = t.id
WHERE p.estado = 'activo'
ORDER BY p.stock_material_kg DESC;

-- 2. Resumen por método de soldadura: Total de procesos y stock promedio de material
SELECT m.nombre_metodo AS metodo, COUNT(p.id) AS total_procesos, AVG(p.stock_material_kg) AS promedio_stock_kg
FROM procesos_soldadura p
JOIN metodos_soldadura m ON p.metodo_id = m.id
GROUP BY m.nombre_metodo
ORDER BY promedio_stock_kg DESC;

-- 3. Procesos en mantenimiento o completados ordenados por fecha de creación
SELECT p.nombre_proyecto, m.nombre_metodo, p.estado, p.creado_en 
FROM procesos_soldadura p
JOIN metodos_soldadura m ON p.metodo_id = m.id
WHERE p.estado IN ('mantenimiento', 'completado')
ORDER BY p.creado_en ASC;

-- 4. Top 3 procesos con mayor stock de material sin importar su estado
SELECT p.nombre_proyecto, m.nombre_metodo, p.stock_material_kg 
FROM procesos_soldadura p
JOIN metodos_soldadura m ON p.metodo_id = m.id
ORDER BY p.stock_material_kg DESC 
LIMIT 3;

-- 5. Listado general de proyectos organizado alfabéticamente por nombre de proyecto
SELECT p.nombre_proyecto, m.nombre_metodo AS metodo, t.nombre_tecnico AS tecnico, p.stock_material_kg, p.estado 
FROM procesos_soldadura p
JOIN metodos_soldadura m ON p.metodo_id = m.id
JOIN tecnicos_soldadura t ON p.tecnico_id = t.id
ORDER BY p.nombre_proyecto ASC;