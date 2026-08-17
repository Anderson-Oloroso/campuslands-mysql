USE streaming_carga_db;

-- Consulta 1: Listado detallado de equipos cargados junto a su proveedor y país de origen
SELECT 
    e.nombre_equipo AS 'Equipo',
    e.categoria AS 'Categoría',
    p.nombre_proveedor AS 'Proveedor',
    p.pais_origen AS 'País',
    e.precio AS 'Precio ($)',
    e.estado AS 'Estado'
FROM equipos_streaming e
JOIN proveedores p ON e.id_proveedor = p.id_proveedor
ORDER BY e.precio DESC;

-- Consulta 2: Resumen del stock total y valorizado agrupado por el proveedor de carga
SELECT 
    p.nombre_proveedor AS 'Proveedor',
    COUNT(e.id_equipo) AS 'Variedad de Equipos',
    SUM(e.stock) AS 'Stock Consolidado',
    SUM(e.stock * e.precio) AS 'Inversión Total ($)'
FROM proveedores p
LEFT JOIN equipos_streaming e ON p.id_proveedor = e.id_proveedor
GROUP BY p.id_proveedor, p.nombre_proveedor
ORDER BY 'Inversión Total ($)' DESC;

-- Consulta 3: Top 3 de equipos con mayor inversión unitaria en stock según los datos cargados
SELECT 
    e.nombre_equipo AS 'Equipo Destacado',
    e.categoria AS 'Categoría',
    (e.stock * e.precio) AS 'Valor Total en Stock ($)'
FROM equipos_streaming e
ORDER BY 'Valor Total en Stock ($)' DESC
LIMIT 3;

-- Consulta 4: Filtrar equipos recibidos después del 15 de mayo de 2026 que se encuentren disponibles
SELECT 
    e.nombre_equipo AS 'Equipo',
    e.fecha_recepcion AS 'Fecha de Recepción',
    e.stock AS 'Stock Disponible'
FROM equipos_streaming e
WHERE e.fecha_recepcion > '2026-05-15' AND e.estado = 'Disponible'
ORDER BY e.fecha_recepcion ASC;

-- Consulta 5: Conteo de equipos agrupados por estado de inventario y calificación promedio del proveedor
SELECT 
    e.estado AS 'Estado del Inventario',
    COUNT(*) AS 'Cantidad de Lotes',
    AVG(p.calificacion) AS 'Calificación Promedio del Proveedor'
FROM equipos_streaming e
JOIN proveedores p ON e.id_proveedor = p.id_proveedor
GROUP BY e.estado
ORDER BY 'Cantidad de Lotes' DESC;
