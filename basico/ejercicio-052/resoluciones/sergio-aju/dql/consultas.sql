USE campuslands_mysql;

-- 1. Ordenamiento ascendente básico: Mostrar secuencias ordenadas de menor a mayor por tiempo de renderizado
SELECT 
    codigo_proyecto,
    nombre_secuencia,
    software_empleado,
    tiempo_render_horas,
    estado_proyecto
FROM proyectos_animacion_3d
ORDER BY tiempo_render_horas ASC;

-- 2. Ordenamiento descendente por múltiples columnas: Secuencias ordenadas por calificación de calidad (desc) y presupuesto (desc)
SELECT 
    codigo_proyecto,
    nombre_secuencia,
    software_empleado,
    calificacion_calidad,
    presupuesto_usd,
    estado_proyecto
FROM proyectos_animacion_3d
ORDER BY calificacion_calidad DESC, presupuesto_usd DESC;

-- 3. Ordenamiento basado en expresiones calculadas: Secuencias ordenadas por costo de render por hora (presupuesto / tiempo_render) de mayor a menor
SELECT 
    codigo_proyecto,
    nombre_secuencia,
    software_empleado,
    presupuesto_usd,
    tiempo_render_horas,
    ROUND((presupuesto_usd / tiempo_render_horas), 2) AS costo_por_hora_usd
FROM proyectos_animacion_3d
ORDER BY costo_por_hora_usd DESC;

-- 4. Ranking o Top 5 de proyectos de animación más costosos combinando ORDER BY y LIMIT
SELECT 
    codigo_proyecto,
    nombre_secuencia,
    software_empleado,
    presupuesto_usd,
    calificacion_calidad,
    estado_proyecto
FROM proyectos_animacion_3d
ORDER BY presupuesto_usd DESC
LIMIT 5;

-- 5. Ordenamiento agrupado y filtrado: Secuencias renderizadas ordenadas alfabéticamente por software y secundariamente por número de fotogramas
SELECT 
    codigo_proyecto,
    nombre_secuencia,
    software_empleado,
    fotogramas_totales,
    estado_proyecto
FROM proyectos_animacion_3d
WHERE estado_proyecto = 'renderizado'
ORDER BY software_empleado ASC, fotogramas_totales DESC;