USE arquitectura_3d_update_db;

-- Consulta 1: Listado general post-actualizaciones ordenado por precio
SELECT 
    nombre_escena AS 'Escena 3D',
    categoria AS 'Categoria',
    autor AS 'Creador',
    precio_base_usd AS 'Precio Actualizado (USD)',
    estado AS 'Estado Actual'
FROM render_escenas
ORDER BY precio_base_usd DESC;

-- Consulta 2: Promedio de precio y total de poligonos por categoria
SELECT 
    categoria AS 'Categoria',
    COUNT(*) AS 'Total Modelos',
    ROUND(AVG(precio_base_usd), 2) AS 'Precio Promedio (USD)',
    SUM(poligonos_k) AS 'Total Poligonos (k)'
FROM render_escenas
GROUP BY categoria
ORDER BY `Precio Promedio (USD)` DESC;

-- Consulta 3: Modelos publicados con alto nivel de detalle
SELECT 
    nombre_escena AS 'Modelo Publicado',
    autor AS 'Artista',
    poligonos_k AS 'Poligonos (k)',
    precio_base_usd AS 'Precio (USD)'
FROM render_escenas
WHERE estado = 'publicado' AND poligonos_k >= 400
ORDER BY poligonos_k DESC;

-- Consulta 4: Resumen de estado de los trabajos por autor
SELECT 
    autor AS 'Artista 3D',
    COUNT(*) AS 'Total Entregas',
    SUM(CASE WHEN estado = 'publicado' THEN 1 ELSE 0 END) AS 'Publicados',
    SUM(CASE WHEN estado = 'revisado' THEN 1 ELSE 0 END) AS 'En Revision'
FROM render_escenas
GROUP BY autor
ORDER BY `Total Entregas` DESC;

-- Consulta 5: Top 3 modelos con mayor valor monetario
SELECT 
    nombre_escena AS 'Escena Premium',
    categoria AS 'Tipo',
    precio_base_usd AS 'Valor Final (USD)',
    fecha_modificacion AS 'Ultima Actualizacion'
FROM render_escenas
ORDER BY precio_base_usd DESC
LIMIT 3;
