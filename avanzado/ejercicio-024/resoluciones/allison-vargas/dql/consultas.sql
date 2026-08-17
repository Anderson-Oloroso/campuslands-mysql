USE soldadura_bloqueos_db;

-- Consulta 1: Reporte detallado de asignaciones con estaciones e insumos
SELECT 
    e.codigo_estacion AS 'Estacion',
    e.tipo_proceso AS 'Proceso',
    i.nombre_insumo AS 'Insumo Asignado',
    a.cantidad_asignada_kg AS 'Cantidad (kg)',
    ROUND(a.cantidad_asignada_kg * i.precio_por_kg, 2) AS 'Costo Asignado (USD)'
FROM asignacion_insumos a
JOIN estaciones_soldadura e ON a.id_estacion = e.id_estacion
JOIN inventario_insumos i ON a.id_insumo = i.id_insumo
ORDER BY a.fecha_asignacion DESC;

-- Consulta 2: Valor del inventario restante y total de stock disponible
SELECT 
    tipo_material AS 'Categoria Material',
    COUNT(*) AS 'Total Tipos',
    SUM(stock_kg) AS 'Stock Total (kg)',
    SUM(ROUND(stock_kg * precio_por_kg, 2)) AS 'Valor Total Inventario (USD)'
FROM inventario_insumos
GROUP BY tipo_material
ORDER BY `Valor Total Inventario (USD)` DESC;

-- Consulta 3: Estaciones con estado disponible y sus ultimos consumos
SELECT 
    e.codigo_estacion AS 'Estacion Disponible',
    e.tipo_proceso AS 'Proceso Habilitado',
    COALESCE(SUM(a.cantidad_asignada_kg), 0) AS 'Total Insumo Asignado (kg)'
FROM estaciones_soldadura e
LEFT JOIN asignacion_insumos a ON e.id_estacion = a.id_estacion
WHERE e.estado = 'disponible'
GROUP BY e.id_estacion, e.codigo_estacion, e.tipo_proceso
ORDER BY `Total Insumo Asignado (kg)` DESC;

-- Consulta 4: Insumos mas consumidos en planta
SELECT 
    i.nombre_insumo AS 'Insumo',
    i.stock_kg AS 'Stock Actual (kg)',
    SUM(a.cantidad_asignada_kg) AS 'Total Consumido (kg)'
FROM inventario_insumos i
JOIN asignacion_insumos a ON i.id_insumo = a.id_insumo
GROUP BY i.id_insumo, i.nombre_insumo, i.stock_kg
ORDER BY `Total Consumido (kg)` DESC;

-- Consulta 5: Top 3 estaciones con mayor gasto de insumos
SELECT 
    e.codigo_estacion AS 'Estacion',
    e.tipo_proceso AS 'Tipo Proceso',
    ROUND(SUM(a.cantidad_asignada_kg * i.precio_por_kg), 2) AS 'Gasto Total Insumos (USD)'
FROM asignacion_insumos a
JOIN estaciones_soldadura e ON a.id_estacion = e.id_estacion
JOIN inventario_insumos i ON a.id_insumo = i.id_insumo
GROUP BY e.id_estacion, e.codigo_estacion, e.tipo_proceso
ORDER BY `Gasto Total Insumos (USD)` DESC
LIMIT 3;
