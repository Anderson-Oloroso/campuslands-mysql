USE campuslands_mysql;

-- 1. Conteo total de fórmulas por categoría y suma de stock disponible
SELECT 
    categoria_quimica,
    COUNT(*) AS total_formulas,
    SUM(cantidad_stock_gramos) AS stock_total_gramos
FROM formulas_quimicas
GROUP BY categoria_quimica
ORDER BY total_formulas DESC;

-- 2. Reporte de valor total del inventario por categoría (Suma de cantidad * costo)
SELECT 
    categoria_quimica,
    COUNT(*) AS total_items,
    ROUND(SUM(cantidad_stock_gramos * costo_por_gramo_usd), 2) AS valor_inventario_total_usd
FROM formulas_quimicas
GROUP BY categoria_quimica
ORDER BY valor_inventario_total_usd DESC;

-- 3. Resumen de inventario filtrado por estado de almacén (solo fórmulas disponibles o en cuarentena)
SELECT 
    estado_almacen,
    COUNT(*) AS conteo_registros,
    SUM(cantidad_stock_gramos) AS suma_stock_gramos
FROM formulas_quimicas
WHERE estado_almacen IN ('disponible', 'en_cuarentena')
GROUP BY estado_almacen;

-- 4. Identificación de categorías con inventario crítico (conteo de fórmulas con stock mayor a 2000 gramos)
SELECT 
    categoria_quimica,
    COUNT(*) AS formulas_con_stock_alto
FROM formulas_quimicas
WHERE cantidad_stock_gramos > 2000.00
GROUP BY categoria_quimica
HAVING formulas_con_stock_alto > 1;

-- 5. Ranking de categorías basado en la diversidad (cantidad de compuestos) y riqueza económica
SELECT 
    categoria_quimica,
    COUNT(*) AS variedad_productos,
    ROUND(SUM(costo_por_gramo_usd), 2) AS suma_costos_unitarios
FROM formulas_quimicas
GROUP BY categoria_quimica
ORDER BY suma_costos_unitarios DESC;