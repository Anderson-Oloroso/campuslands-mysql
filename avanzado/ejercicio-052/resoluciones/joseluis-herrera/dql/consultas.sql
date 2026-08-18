USE campuslands_mysql;

SELECT
    id_proyecto,
    titulo,
    tipo_animacion,
    estado,
    presupuesto,
    total_artistas,
    horas_totales
FROM vista_resumen_proyectos
ORDER BY horas_totales DESC;

SELECT
    id_artista,
    nombre,
    especialidad,
    total_proyectos,
    horas_totales,
    promedio_horas
FROM vista_carga_artistas
ORDER BY horas_totales DESC;

SELECT
    titulo,
    presupuesto,
    total_artistas,
    horas_totales
FROM vista_resumen_proyectos
WHERE estado = 'en_produccion'
ORDER BY presupuesto DESC;

SELECT
    nombre,
    especialidad,
    total_proyectos,
    horas_totales
FROM vista_carga_artistas
WHERE total_proyectos > 1
ORDER BY horas_totales DESC;

SELECT
    titulo,
    tipo_animacion,
    presupuesto,
    horas_totales
FROM vista_resumen_proyectos
WHERE horas_totales >= 80
ORDER BY horas_totales DESC
LIMIT 5;