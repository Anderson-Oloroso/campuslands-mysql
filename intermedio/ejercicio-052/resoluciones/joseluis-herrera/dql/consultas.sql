USE campuslands_mysql;

SELECT
    p.titulo,
    p.tipo_animacion,
    p.estado,
    COUNT(pa.id_artista) AS total_artistas
FROM proyectos_3d AS p
INNER JOIN proyectos_artistas AS pa
    ON p.id_proyecto = pa.id_proyecto
GROUP BY p.id_proyecto, p.titulo, p.tipo_animacion, p.estado
ORDER BY total_artistas DESC;

SELECT
    a.nombre AS artista,
    a.especialidad,
    COUNT(pa.id_proyecto) AS total_proyectos
FROM artistas AS a
INNER JOIN proyectos_artistas AS pa
    ON a.id_artista = pa.id_artista
GROUP BY a.id_artista, a.nombre, a.especialidad
ORDER BY total_proyectos DESC;

SELECT
    p.titulo,
    a.nombre AS artista,
    pa.rol,
    pa.horas_trabajadas
FROM proyectos_3d AS p
INNER JOIN proyectos_artistas AS pa
    ON p.id_proyecto = pa.id_proyecto
INNER JOIN artistas AS a
    ON pa.id_artista = a.id_artista
WHERE p.estado = 'en_produccion'
ORDER BY pa.horas_trabajadas DESC;

SELECT
    p.titulo,
    p.presupuesto,
    SUM(pa.horas_trabajadas) AS horas_totales
FROM proyectos_3d AS p
INNER JOIN proyectos_artistas AS pa
    ON p.id_proyecto = pa.id_proyecto
GROUP BY p.id_proyecto, p.titulo, p.presupuesto
ORDER BY horas_totales DESC;

SELECT
    a.nombre AS artista,
    a.especialidad,
    AVG(pa.horas_trabajadas) AS promedio_horas
FROM artistas AS a
INNER JOIN proyectos_artistas AS pa
    ON a.id_artista = pa.id_artista
GROUP BY a.id_artista, a.nombre, a.especialidad
ORDER BY promedio_horas DESC
LIMIT 5;