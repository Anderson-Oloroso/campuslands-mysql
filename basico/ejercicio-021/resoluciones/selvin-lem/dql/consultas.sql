-- Ejercicio 021: consultas con WHERE

USE campuslands_mysql;

-- 1. Proyectos aprobados ordenados por precio.
SELECT titulo, artista, precio
FROM proyectos_dibujo_021
WHERE estado = 'aprobado'
ORDER BY precio DESC;

-- 2. Proyectos con precio superior a 500.
SELECT titulo, categoria, precio
FROM proyectos_dibujo_021
WHERE precio > 500
ORDER BY precio DESC;

-- 3. Proyectos de fantasia o retrato.
SELECT titulo, artista, categoria, estado
FROM proyectos_dibujo_021
WHERE categoria IN ('fantasia', 'retrato')
ORDER BY categoria, titulo;

-- 4. Proyectos que requieren entre 10 y 25 horas.
SELECT titulo, horas_estimadas, fecha_entrega
FROM proyectos_dibujo_021
WHERE horas_estimadas BETWEEN 10 AND 25
ORDER BY horas_estimadas;

-- 5. Proyectos pendientes de aprobacion.
SELECT titulo, artista, estado
FROM proyectos_dibujo_021
WHERE estado = 'borrador' OR estado = 'revision'
ORDER BY fecha_entrega;

-- 6. Proyectos con entrega desde septiembre de 2026.
SELECT titulo, categoria, fecha_entrega
FROM proyectos_dibujo_021
WHERE fecha_entrega >= '2026-09-01'
ORDER BY fecha_entrega;
