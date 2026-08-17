USE streaming_relaciones_db;

-- Consulta 1: Listado general de equipos vinculados a su categoría usando INNER JOIN
SELECT 
    e.nombre_equipo AS 'Equipo',
    c.nombre_categoria AS 'Categoría',
    e.precio AS 'Precio ($)',
    e.stock AS 'Stock',
    e.estado AS 'Estado'
FROM equipos_streaming e
JOIN categorias_streaming c ON e.id_categoria = c.id_categoria
ORDER BY e.precio DESC;

-- Consulta 2: Conteo de equipos y costo promedio agrupados por el nombre de la categoría
SELECT 
    c.nombre_categoria AS 'Categoría',
    COUNT(e.id_equipo) AS 'Total de Equipos',
    AVG(e.precio) AS 'Precio Promedio ($)'
FROM categorias_streaming c
LEFT JOIN equipos_streaming e ON c.id_categoria = e.id_categoria
GROUP BY c.id_categoria, c.nombre_categoria
ORDER BY 'Total de Equipos' DESC;

-- Consulta 3: Top 3 de equipos más costosos con su respectiva categoría (Ranking)
SELECT 
    e.nombre_equipo AS 'Equipo Destacado',
    c.nombre_categoria AS 'Categoría',
    e.precio AS 'Precio Máximo ($)'
FROM equipos_streaming e
JOIN categorias_streaming c ON e.id_categoria = c.id_categoria
ORDER BY e.precio DESC
LIMIT 3;

-- Consulta 4: Filtrar equipos disponibles cuyo precio sea menor a 150 dólares
SELECT 
    e.nombre_equipo AS 'Equipo Económico',
    c.nombre_categoria AS 'Categoría',
    e.precio AS 'Precio ($)'
FROM equipos_streaming e
JOIN categorias_streaming c ON e.id_categoria = c.id_categoria
WHERE e.estado = 'Disponible' AND e.precio < 150.00
ORDER BY e.precio ASC;

-- Consulta 5: Resumen de inventario total valorado agrupado por categoría para equipos activos
SELECT 
    c.nombre_categoria AS 'Categoría',
    SUM(e.stock) AS 'Stock Consolidado',
    SUM(e.stock * e.precio) AS 'Inversión en Inventario ($)'
FROM equipos_streaming e
JOIN categorias_streaming c ON e.id_categoria = c.id_categoria
WHERE e.estado = 'Disponible'
GROUP BY c.id_categoria, c.nombre_categoria
ORDER BY 'Inversión en Inventario ($)' DESC;
