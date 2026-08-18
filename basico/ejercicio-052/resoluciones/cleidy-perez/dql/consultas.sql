-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    nombre_proyecto,
    estudio,
    tiempo_render_horas,
    fotogramas_totales
FROM proyectos_animacion_3d
ORDER BY tiempo_render_horas DESC;

SELECT 
    nombre_proyecto,
    software_principal,
    fecha_entrega
FROM proyectos_animacion_3d
ORDER BY fecha_entrega ASC;
