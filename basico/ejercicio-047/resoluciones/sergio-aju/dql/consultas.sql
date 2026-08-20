USE campuslands_mysql;

-- 1. Filtrar y ordenar: Mostrar prendas disponibles cuyo precio sea menor a 50.00 ordenadas de menor a mayor precio
SELECT 
    codigo_sku,
    nombre_prenda,
    categoria,
    talla,
    precio_unitario,
    stock_disponible
FROM inventario_tienda_ropa
WHERE estado_prenda = 'disponible' AND precio_unitario < 50.00
ORDER BY precio_unitario ASC;

-- 2. Reporte agrupado por categoría: Calcular la cantidad de referencias, el stock total y el precio promedio por categoría
SELECT 
    categoria,
    COUNT(*) AS total_referencias,
    SUM(stock_disponible) AS stock_total_categoria,
    ROUND(AVG(precio_unitario), 2) AS precio_promedio
FROM inventario_tienda_ropa
GROUP BY categoria
ORDER BY stock_total_categoria DESC;

-- 3. Análisis de valor del inventario: Calcular el valor monetario potencial (stock * precio) por cada prenda
SELECT 
    codigo_sku,
    nombre_prenda,
    precio_unitario,
    stock_disponible,
    (precio_unitario * stock_disponible) AS valor_total_inventario_item
FROM inventario_tienda_ropa
WHERE stock_disponible > 0
ORDER BY valor_total_inventario_item DESC;

-- 4. Top 3 de prendas más costosas en la tienda de ropa
SELECT 
    nombre_prenda,
    categoria,
    talla,
    precio_unitario,
    estado_prenda
FROM inventario_tienda_ropa
ORDER BY precio_unitario DESC
LIMIT 3;

-- 5. Consulta de prendas impermeables o en oferta utilizando tipos booleanos y estados
SELECT 
    codigo_sku,
    nombre_prenda,
    categoria,
    precio_unitario,
    CASE 
        WHEN es_impermeable = 1 THEN 'Sí' 
        ELSE 'No' 
    END AS impermeable,
    estado_prenda
FROM inventario_tienda_ropa
WHERE es_impermeable = 1 OR estado_prenda = 'en_oferta'
ORDER BY precio_unitario DESC;