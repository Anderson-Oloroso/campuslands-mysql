USE campuslands_mysql;

-- 1. Proyectos ordenados por presupuesto de mayor a menor.
SELECT
    titulo,
    animador,
    presupuesto,
    estado
FROM proyectos_animacion_3d
ORDER BY presupuesto DESC;


-- 2. Proyectos ordenados por duración de menor a mayor.
SELECT
    titulo,
    animador,
    duracion_segundos,
    estado
FROM proyectos_animacion_3d
ORDER BY duracion_segundos ASC;


-- 3. Proyectos activos ordenados por fecha de entrega.
SELECT
    titulo,
    animador,
    fecha_entrega,
    estado
FROM proyectos_animacion_3d
WHERE estado = 'activo'
ORDER BY fecha_entrega ASC;


-- 4. Los 5 proyectos con mayor presupuesto.
SELECT
    titulo,
    animador,
    presupuesto
FROM proyectos_animacion_3d
ORDER BY presupuesto DESC
LIMIT 5;


-- 5. Proyectos ordenados por software y, dentro de cada software,
-- por presupuesto de mayor a menor.
SELECT
    titulo,
    software,
    presupuesto
FROM proyectos_animacion_3d
ORDER BY software ASC, presupuesto DESC;