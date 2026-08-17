USE animacion_3d_db;

-- Consulta 1: Ordenar renders completados por tiempo de render (ORDER BY DESC)
SELECT 
    nombre_proyecto AS 'Proyecto',
    software_render AS 'Motor 3D',
    tiempo_render_minutos AS 'Tiempo (Minutos)',
    costo_farm_usd AS 'Costo (USD)'
FROM renders_3d
WHERE estado = 'completado'
ORDER BY tiempo_render_minutos DESC;

-- Consulta 2: Ordenar por software y luego por costo descendente
SELECT 
    software_render AS 'Motor 3D',
    nombre_proyecto AS 'Proyecto',
    resolucion AS 'Resolución',
    costo_farm_usd AS 'Costo (USD)'
FROM renders_3d
ORDER BY software_render ASC, costo_farm_usd DESC;

-- Consulta 3: Top 5 renders más costosos en 4K
SELECT 
    nombre_proyecto AS 'Proyecto 4K',
    artista AS 'Artista',
    total_frames AS 'Frames',
    costo_farm_usd AS 'Costo Total (USD)'
FROM renders_3d
WHERE resolucion = '4K'
ORDER BY costo_farm_usd DESC
LIMIT 5;

-- Consulta 4: Promedio de tiempo por frame ordenado por eficiencia
SELECT 
    nombre_proyecto AS 'Proyecto',
    software_render AS 'Motor 3D',
    total_frames AS 'Frames',
    tiempo_render_minutos AS 'Minutos Totales',
    ROUND((tiempo_render_minutos * 60) / total_frames, 2) AS 'Segundos Por Frame'
FROM renders_3d
WHERE estado = 'completado'
ORDER BY `Segundos Por Frame` ASC;

-- Consulta 5: Renders ordenados por fecha (recientes primero)
SELECT 
    nombre_proyecto AS 'Proyecto',
    artista AS 'Artista',
    estado AS 'Estado',
    fecha_render AS 'Fecha de Render'
FROM renders_3d
ORDER BY fecha_render DESC;
