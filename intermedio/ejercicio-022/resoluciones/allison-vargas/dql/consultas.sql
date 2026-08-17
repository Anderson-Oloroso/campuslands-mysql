USE animacion_3d_2fn_db;

-- Consulta 1: Reporte con JOIN de proyectos completados
SELECT 
    p.nombre_escena AS 'Escena',
    a.nombre AS 'Artista',
    m.nombre_engine AS 'Motor 3D',
    p.costo_total AS 'Costo Total (USD)'
FROM proyectos_render p
JOIN artistas a ON p.id_artista = a.id_artista
JOIN motores_render m ON p.id_motor = m.id_motor
WHERE p.estado = 'completado'
ORDER BY p.costo_total DESC;

-- Consulta 2: Total invertido y horas consumidas por cada artista
SELECT 
    a.nombre AS 'Artista',
    COUNT(p.id_proyecto) AS 'Total Proyectos',
    SUM(p.tiempo_horas) AS 'Horas Totales',
    SUM(p.costo_total) AS 'Inversion Total (USD)'
FROM artistas a
LEFT JOIN proyectos_render p ON a.id_artista = p.id_artista
GROUP BY a.id_artista, a.nombre
ORDER BY `Inversion Total (USD)` DESC;

-- Consulta 3: Proyectos que utilizan motores de render tipo GPU
SELECT 
    p.nombre_escena AS 'Proyecto',
    m.nombre_engine AS 'Motor',
    m.tipo AS 'Tipo Procesamiento',
    p.total_frames AS 'Fotogramas'
FROM proyectos_render p
JOIN motores_render m ON p.id_motor = m.id_motor
WHERE m.tipo = 'GPU'
ORDER BY p.total_frames DESC;

-- Consulta 4: Promedio de costo por hora segun el motor de render
SELECT 
    m.nombre_engine AS 'Motor 3D',
    COUNT(p.id_proyecto) AS 'Renders Realizados',
    ROUND(AVG(p.costo_total / p.tiempo_horas), 2) AS 'Costo Real Promedio/Hora'
FROM motores_render m
JOIN proyectos_render p ON m.id_motor = p.id_motor
GROUP BY m.id_motor, m.nombre_engine
HAVING COUNT(p.id_proyecto) > 0;

-- Consulta 5: Top 3 proyectos mas costosos producidos por especialidad VFX o Rigging
SELECT 
    p.nombre_escena AS 'Escena Compleja',
    a.nombre AS 'Artista',
    a.especialidad AS 'Especialidad',
    p.costo_total AS 'Costo (USD)'
FROM proyectos_render p
JOIN artistas a ON p.id_artista = a.id_artista
WHERE a.especialidad IN ('VFX y FX', 'Rigging y Animacion')
ORDER BY p.costo_total DESC
LIMIT 3;