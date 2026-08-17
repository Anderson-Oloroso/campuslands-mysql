USE marketplace_vistas_db;

-- Consulta 1: Consultar la vista simple de accesorios disponibles ordenada por precio descendente
SELECT 
    nombre_accesorio AS 'Accesorio Disponible',
    categoria AS 'Categoría',
    precio AS 'Precio ($)',
    stock AS 'Stock'
FROM vw_accesorios_disponibles
ORDER BY precio DESC;

-- Consulta 2: Calcular el valor total del inventario agrupado por categoría usando la vista
SELECT 
    categoria AS 'Categoría',
    COUNT(*) AS 'Cantidad de Artículos',
    SUM(valor_inventario) AS 'Inversión Total en Stock ($)'
FROM vw_accesorios_disponibles
GROUP BY categoria
ORDER BY 'Inversión Total en Stock ($)' DESC;

-- Consulta 3: Top 3 de accesorios con mayor valor acumulado en inventario desde la vista
SELECT 
    nombre_accesorio AS 'Accesorio Destacado',
    categoria AS 'Categoría',
    valor_inventario AS 'Valor en Inventario ($)'
FROM vw_accesorios_disponibles
ORDER BY valor_inventario DESC
LIMIT 3;

-- Consulta 4: Filtrar accesorios desde la vista que tengan un precio menor a 50 y stock mayor a 40
SELECT 
    nombre_accesorio AS 'Accesorio Económico',
    precio AS 'Precio ($)',
    stock AS 'Stock Disponible'
FROM vw_accesorios_disponibles
WHERE precio < 50.00 AND stock > 40
ORDER BY stock DESC;

-- Consulta 5: Reporte general combinando estados de la tabla base con conteos
SELECT 
    estado AS 'Estado del Producto',
    COUNT(*) AS 'Total de Registros',
    AVG(precio) AS 'Precio Promedio ($)'
FROM accesorios_tienda
GROUP BY estado
ORDER BY 'Total de Registros' DESC;
