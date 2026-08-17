USE campuslands_mysql;

-- 1. Instructores con mas de 2 saltos completados
SELECT instructor, COUNT(*) AS saltos_completados
FROM saltos_intermedio
WHERE estado = 'completado'
GROUP BY instructor
HAVING COUNT(*) > 2
ORDER BY saltos_completados DESC;

-- 2. Tipos de salto con ingreso total (solo completados) mayor a 500
SELECT tipo_salto, SUM(costo) AS ingreso_total
FROM saltos_intermedio
WHERE estado = 'completado'
GROUP BY tipo_salto
HAVING SUM(costo) > 500
ORDER BY ingreso_total DESC;

-- 3. Alumnos repetidores: mas de un salto registrado, sin importar el estado
SELECT alumno, COUNT(*) AS total_saltos
FROM saltos_intermedio
GROUP BY alumno
HAVING COUNT(*) > 1
ORDER BY total_saltos DESC;

-- 4. Tipos de salto cuya altura promedio supera los 3500 metros
SELECT tipo_salto, AVG(altura_metros) AS altura_promedio
FROM saltos_intermedio
GROUP BY tipo_salto
HAVING AVG(altura_metros) > 3500
ORDER BY altura_promedio DESC;

-- 5. Instructores cuyo total facturado en saltos completados supera 700
SELECT instructor, SUM(costo) AS total_facturado
FROM saltos_intermedio
WHERE estado = 'completado'
GROUP BY instructor
HAVING SUM(costo) > 700
ORDER BY total_facturado DESC;

-- 6. Fechas con mas de un salto registrado ese mismo dia
SELECT fecha_salto, COUNT(*) AS saltos_en_el_dia
FROM saltos_intermedio
GROUP BY fecha_salto
HAVING COUNT(*) > 1
ORDER BY fecha_salto;
