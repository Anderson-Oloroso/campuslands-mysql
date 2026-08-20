USE animacion_3d_db;

-- 1. Ordenar los proyectos de animación de mayor a menor calificación técnica utilizando ORDER BY DESC
SELECT codigo_proyecto, nombre_proyecto, software_3d, calificacion_tecnica, estado_proyecto
FROM proyectos_animacion
ORDER BY calificacion_tecnica DESC;

-- 2. Ordenar los proyectos de animación por tiempo de renderizado de menor a mayor (orden ascendente por defecto con ASC)
SELECT codigo_proyecto, nombre_proyecto, software_3d, tiempo_render_horas, estado_proyecto
FROM proyectos_animacion
ORDER BY tiempo_render_horas ASC;

-- 3. Ordenamiento multinivel: Ordenar primero por software 3D alfabéticamente y, en caso de empate, por calificación técnica de forma descendente
SELECT codigo_proyecto, nombre_proyecto, software_3d, calificacion_tecnica, estado_proyecto
FROM proyectos_animacion
ORDER BY software_3d ASC, calificacion_tecnica DESC;

-- 4. Filtrar proyectos completados y ordenarlos por tiempo de renderizado de forma descendente (del más pesado al más ligero)
SELECT codigo_proyecto, nombre_proyecto, software_3d, tiempo_render_horas, estado_proyecto
FROM proyectos_animacion
WHERE estado_proyecto = 'completado'
ORDER BY tiempo_render_horas DESC;

-- 5. Generar un ranking de los 5 mejores proyectos limitando la salida tras ordenar por calificación técnica descendente
SELECT codigo_proyecto, nombre_proyecto, software_3d, tiempo_render_horas, calificacion_tecnica, estado_proyecto
FROM proyectos_animacion
ORDER BY calificacion_tecnica DESC
LIMIT 5;