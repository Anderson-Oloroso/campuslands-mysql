USE campuslands_mysql;

-- 1. Instructores con mas de 2 saltos completados
SELECT instructor, COUNT(*) AS saltos_completados
FROM saltos_club_intermedio
WHERE estado = 'completado'
GROUP BY instructor
HAVING COUNT(*) > 2
ORDER BY saltos_completados DESC;

-- 2. Tipos de salto con ingreso total (solo completados) mayor a 400000
SELECT tipo_salto, SUM(costo) AS ingreso_total
FROM saltos_club_intermedio
WHERE estado = 'completado'
GROUP BY tipo_salto
HAVING SUM(costo) > 400000
ORDER BY ingreso_total DESC;

-- 3. Paracaidistas con mas de un salto registrado
SELECT paracaidista, COUNT(*) AS total_saltos
FROM saltos_club_intermedio
GROUP BY paracaidista
HAVING COUNT(*) > 1
ORDER BY total_saltos DESC;

-- 4. Instructores cuyo total facturado en saltos completados supera 800000
SELECT instructor, SUM(costo) AS total_facturado
FROM saltos_club_intermedio
WHERE estado = 'completado'
GROUP BY instructor
HAVING SUM(costo) > 800000
ORDER BY total_facturado DESC;

-- 5. Tipos de salto cuyo costo promedio supera 400000
SELECT tipo_salto, AVG(costo) AS costo_promedio
FROM saltos_club_intermedio
GROUP BY tipo_salto
HAVING AVG(costo) > 400000
ORDER BY costo_promedio DESC;

-- 6. Fechas con mas de un salto registrado el mismo dia
SELECT fecha_salto, COUNT(*) AS saltos_en_el_dia
FROM saltos_club_intermedio
GROUP BY fecha_salto
HAVING COUNT(*) > 1
ORDER BY fecha_salto;
