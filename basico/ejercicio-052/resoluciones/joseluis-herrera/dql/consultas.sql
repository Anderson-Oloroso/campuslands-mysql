USE campuslands_mysql;

SELECT
    titulo,
    artista,
    presupuesto,
    estado
FROM proyectos_3d
ORDER BY presupuesto DESC;

SELECT
    titulo,
    tipo_animacion,
    duracion_segundos,
    fecha_entrega
FROM proyectos_3d
ORDER BY duracion_segundos ASC;

SELECT
    titulo,
    artista,
    fecha_entrega,
    estado
FROM proyectos_3d
ORDER BY fecha_entrega ASC;

SELECT
    estado,
    COUNT(*) AS total_proyectos,
    AVG(presupuesto) AS presupuesto_promedio
FROM proyectos_3d
GROUP BY estado
ORDER BY total_proyectos DESC;

SELECT
    titulo,
    artista,
    presupuesto,
    duracion_segundos
FROM proyectos_3d
WHERE estado <> 'finalizado'
ORDER BY presupuesto DESC, duracion_segundos DESC
LIMIT 5;