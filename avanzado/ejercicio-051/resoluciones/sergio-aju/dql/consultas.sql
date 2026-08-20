-- Consultas DQL y uso de EXPLAIN para analizar la estrategia de ejecución del optimizador
USE campuslands_mysql;

-- 1. Análisis EXPLAIN: Búsqueda por artista y estado aprovechando idx_ilustraciones_artista_estado
EXPLAIN SELECT 
    i.id AS obra_id,
    a.nombre_artistico AS artista,
    i.titulo,
    i.numero_capas,
    i.tiempo_trabajo_horas,
    i.estado
FROM ilustraciones i
JOIN artistas_digitales a ON i.artista_id = a.id
WHERE i.artista_id = 1 AND i.estado = 'Finalizado';

-- 2. Análisis EXPLAIN FORMAT=JSON: Detalle del costo de ejecución y tipo de Join
EXPLAIN FORMAT=JSON
SELECT 
    s.nombre AS software,
    COUNT(i.id) AS total_proyectos,
    AVG(i.tiempo_trabajo_horas) AS promedio_horas,
    SUM(i.tamano_archivo_mb) AS almacenamiento_total_mb
FROM software_herramientas s
JOIN ilustraciones i ON s.id = i.software_id
WHERE i.tiempo_trabajo_horas > 10.0
GROUP BY s.id, s.nombre;

-- 3. Consulta de ranking de proyectos con mayor complejidad técnica (Capas y Tamaño)
SELECT 
    i.id AS id_proyecto,
    a.nombre_artistico AS artista,
    s.nombre AS software_usado,
    i.titulo,
    i.numero_capas,
    i.tamano_archivo_mb,
    i.tiempo_trabajo_horas
FROM ilustraciones i
JOIN artistas_digitales a ON i.artista_id = a.id
JOIN software_herramientas s ON i.software_id = s.id
ORDER BY i.numero_capas DESC
LIMIT 5;

-- 4. Reporte agrupado de distribución de proyectos por nivel de artista y estado de la obra
SELECT 
    a.nivel,
    i.estado,
    COUNT(i.id) AS cantidad_obras,
    ROUND(AVG(i.tamano_archivo_mb), 2) AS tamano_promedio_mb
FROM artistas_digitales a
JOIN ilustraciones i ON a.id = i.artista_id
GROUP BY a.nivel, i.estado
ORDER BY a.nivel, cantidad_obras DESC;

-- 5. Búsqueda de obras pesadas (>500MB) para auditoría de almacenamiento
EXPLAIN ANALYZE SELECT 
    i.titulo,
    a.nombre_artistico,
    i.resolucion_px,
    i.tamano_archivo_mb,
    i.fecha_creacion
FROM ilustraciones i
JOIN artistas_digitales a ON i.artista_id = a.id
WHERE i.tamano_archivo_mb >= 500.00
ORDER BY i.fecha_creacion DESC;