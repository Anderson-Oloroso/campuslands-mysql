USE campuslands_mysql;

-- ==========================================
-- SECCIÓN DE CONSULTAS OPTIMIZADAS
-- ==========================================

-- 1. Consulta optimizada aprovechando el índice compuesto (categoria, estado) para filtrado rápido
SELECT codigo_serial, nombre_equipo, categoria, precio_venta, stock_actual
FROM inventario_streaming_avanzado
WHERE categoria = 'Microfono' AND estado = 'disponible'
ORDER BY precio_venta DESC;

-- 2. Análisis de rendimiento utilizando EXPLAIN para verificar el uso eficiente de índices en la búsqueda por precio
EXPLAIN
SELECT nombre_equipo, categoria, precio_venta
FROM inventario_streaming_avanzado
WHERE precio_venta > 150.00
ORDER BY precio_venta ASC;

-- 3. Consulta optimizada de ventas totales agrupadas por equipo mediante JOIN indexado
SELECT 
    i.nombre_equipo,
    i.categoria,
    SUM(t.cantidad_vendida) AS total_unidades_vendidas,
    SUM(t.monto_total) AS ingreso_generado
FROM transacciones_streaming_avanzado t
JOIN inventario_streaming_avanzado i ON t.equipo_id = i.id
GROUP BY i.id, i.nombre_equipo, i.categoria
ORDER BY ingreso_generado DESC;

-- 4. Filtrado optimizado por rangos de fecha en transacciones utilizando índices temporales
SELECT 
    t.fecha_transaccion,
    i.nombre_equipo,
    t.cantidad_vendida,
    t.monto_total
FROM transacciones_streaming_avanzado t
JOIN inventario_streaming_avanzado i ON t.equipo_id = i.id
WHERE t.fecha_transaccion >= '2026-08-10' AND t.fecha_transaccion <= '2026-08-18'
ORDER BY t.fecha_transaccion DESC;

-- 5. Top 3 equipos con mayor volumen de ventas utilizando subconsulta optimizada y límites
SELECT 
    i.nombre_equipo,
    i.categoria,
    SUM(t.cantidad_vendida) AS unidades_totales
FROM inventario_streaming_avanzado i
JOIN transacciones_streaming_avanzado t ON i.id = t.equipo_id
GROUP BY i.id, i.nombre_equipo, i.categoria
ORDER BY unidades_totales DESC
LIMIT 3;