-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    p.proyecto_id,
    p.titulo_proyecto,
    e.nombre_estudio,
    s.nombre_software,
    a.nombre_artista,
    a.especialidad,
    ap.rol_en_proyecto,
    ap.horas_asignadas
FROM proyectos_3d p
INNER JOIN estudios_animacion e ON p.estudio_id = e.estudio_id
INNER JOIN software_3d s ON p.software_id = s.software_id
INNER JOIN asignaciones_proyecto ap ON p.proyecto_id = ap.proyecto_id
INNER JOIN artistas_3d a ON ap.artista_id = a.artista_id
ORDER BY p.proyecto_id ASC, ap.horas_asignadas DESC;

SELECT 
    p.proyecto_id,
    p.titulo_proyecto,
    e.nombre_estudio,
    COUNT(DISTINCT ap.artista_id) AS total_artistas_asignados,
    COALESCE(SUM(ap.horas_asignadas), 0.00) AS total_horas_invertidas
FROM proyectos_3d p
INNER JOIN estudios_animacion e ON p.estudio_id = e.estudio_id
LEFT JOIN asignaciones_proyecto ap ON p.proyecto_id = ap.proyecto_id
GROUP BY p.proyecto_id, p.titulo_proyecto, e.nombre_estudio
ORDER BY total_horas_invertidas DESC;
