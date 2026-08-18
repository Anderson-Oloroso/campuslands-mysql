USE campuslands_mysql;


-- 1. Mostrar todos los proyectos finalizados.
SELECT
    nombre_proyecto,
    artista,
    tecnica,
    categoria,
    precio,
    estado
FROM proyectos_digitales
WHERE estado = 'finalizado'
ORDER BY fecha_entrega ASC;


-- 2. Mostrar proyectos con precio superior a 600.
SELECT
    nombre_proyecto,
    artista,
    categoria,
    precio
FROM proyectos_digitales
WHERE precio > 600
ORDER BY precio DESC;


-- 3. Mostrar proyectos que requieren 10 horas o más.
SELECT
    nombre_proyecto,
    artista,
    horas_trabajo,
    precio
FROM proyectos_digitales
WHERE horas_trabajo >= 10
ORDER BY horas_trabajo DESC;


-- 4. Mostrar proyectos realizados con técnica Digital Painting.
SELECT
    nombre_proyecto,
    artista,
    categoria,
    precio
FROM proyectos_digitales
WHERE tecnica = 'Digital Painting'
ORDER BY precio DESC;


-- 5. Mostrar proyectos de la categoría Retrato o Paisaje.
SELECT
    nombre_proyecto,
    artista,
    categoria,
    precio
FROM proyectos_digitales
WHERE categoria IN ('Retrato', 'Paisaje')
ORDER BY categoria, precio DESC;


-- 6. Mostrar proyectos que estén pendientes o en proceso
-- y cuyo precio sea superior a 500.
SELECT
    nombre_proyecto,
    artista,
    estado,
    precio
FROM proyectos_digitales
WHERE estado IN ('pendiente', 'en_proceso')
  AND precio > 500
ORDER BY precio DESC;


-- 7. Mostrar proyectos cuyo precio esté entre 300 y 800.
SELECT
    nombre_proyecto,
    artista,
    categoria,
    precio
FROM proyectos_digitales
WHERE precio BETWEEN 300 AND 800
ORDER BY precio ASC;


-- 8. Mostrar proyectos que no hayan sido cancelados.
SELECT
    nombre_proyecto,
    artista,
    tecnica,
    categoria,
    estado
FROM proyectos_digitales
WHERE estado <> 'cancelado'
ORDER BY fecha_entrega ASC;