USE marketplace_accesorios_db;

-- Consulta 1: Listado de accesorios con ofertas activas ordenados por precio descendente
SELECT 
    nombre_accesorio AS 'Accesorio',
    categoria AS 'Categoría',
    precio AS 'Precio ($)',
    stock AS 'Stock Disponible',
    fecha_expiracion AS 'Expira el'
FROM productos_accesorios
WHERE estado_oferta = 'Activa'
ORDER BY precio DESC;

-- Consulta 2: Conteo de accesorios y valoración de inventario agrupados por estado de oferta
SELECT 
    estado_oferta AS 'Estado de Oferta',
    COUNT(*) AS 'Total de Productos',
    SUM(stock * precio) AS 'Valor Total del Inventario ($)'
FROM productos_accesorios
GROUP BY estado_oferta;

-- Consulta 3: Top 3 de accesorios más costosos en el marketplace (Ranking)
SELECT 
    nombre_accesorio AS 'Accesorio Destacado',
    categoria AS 'Categoría',
    precio AS 'Precio Máximo ($)'
FROM productos_accesorios
ORDER BY precio DESC
LIMIT 3;

-- Consulta 4: Filtrar accesorios con stock menor a 50 unidades y estado activo o pendiente
SELECT 
    nombre_accesorio AS 'Accesorio',
    stock AS 'Stock Crítico',
    estado_oferta AS 'Estado'
FROM productos_accesorios
WHERE stock < 50 AND estado_oferta IN ('Activa', 'Pendiente')
ORDER BY stock ASC;

-- Consulta 5: Reporte de stock y precio promedio agrupado por categoría para productos activos
SELECT 
    categoria AS 'Categoría',
    COUNT(*) AS 'Variedad Activa',
    SUM(stock) AS 'Stock Consolidado',
    AVG(precio) AS 'Precio Promedio ($)'
FROM productos_accesorios
WHERE estado_oferta = 'Activa'
GROUP BY categoria
ORDER BY 'Stock Consolidado' DESC;
