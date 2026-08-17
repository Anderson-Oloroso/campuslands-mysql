USE streaming_optimizacion_db;

-- Consulta 1: Listado optimizado de equipos disponibles aprovechando índices de categoría
SELECT 
    nombre_equipo AS 'Equipo de Streaming',
    categoria AS 'Categoría',
    precio AS 'Precio ($)',
    stock AS 'Stock'
FROM equipos_streaming
WHERE estado = 'Disponible'
ORDER BY precio DESC;

-- Consulta 2: Conteo y valor total del inventario agrupado por categoría (utilizando índices)
SELECT 
    categoria AS 'Categoría',
    COUNT(*) AS 'Cantidad de Modelos',
    SUM(stock * precio) AS 'Valor del Inventario ($)'
FROM equipos_streaming
GROUP BY categoria
ORDER BY 'Valor del Inventario ($)' DESC;

-- Consulta 3: Top 3 de equipos más costosos para optimizar presupuestos de producción
SELECT 
    nombre_equipo AS 'Equipo Destacado',
    categoria AS 'Categoría',
    precio AS 'Precio Máximo ($)'
FROM equipos_streaming
ORDER BY precio DESC
LIMIT 3;

-- Consulta 4: Filtrado eficiente de equipos con stock bajo y estado disponible
SELECT 
    nombre_equipo AS 'Equipo',
    stock AS 'Stock Crítico',
    precio AS 'Precio ($)'
FROM equipos_streaming
WHERE stock < 25 AND estado = 'Disponible'
ORDER BY stock ASC;

-- Consulta 5: Reporte de rendimiento y costo promedio agrupado por estado del equipo
SELECT 
    estado AS 'Estado del Hardware',
    COUNT(*) AS 'Total de Registros',
    AVG(precio) AS 'Precio Promedio ($)'
FROM equipos_streaming
GROUP BY estado
ORDER BY 'Total de Registros' DESC;
