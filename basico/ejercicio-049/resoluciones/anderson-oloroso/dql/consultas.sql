USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por costo_salto descendentemente
SELECT salto_id, instructor, modalidad, altura_pies, costo_salto, estado
FROM saltos_paracaidismo
ORDER BY costo_salto DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT salto_id, instructor, modalidad, costo_salto
FROM saltos_paracaidismo
WHERE estado = 'Activo';

-- 3. Agrupar por modalidad y calcular total y promedio de costo_salto
SELECT modalidad, COUNT(*) AS total_registros, AVG(costo_salto) AS promedio_valor
FROM saltos_paracaidismo
GROUP BY modalidad
ORDER BY promedio_valor DESC;

-- 4. Filtrar por costo_salto mayor a 2000
SELECT salto_id, instructor, modalidad, costo_salto
FROM saltos_paracaidismo
WHERE costo_salto > 2000.00
ORDER BY costo_salto ASC;

-- 5. Seleccionar los 5 mejores registros según costo_salto
SELECT salto_id, instructor, modalidad, costo_salto
FROM saltos_paracaidismo
ORDER BY costo_salto DESC
LIMIT 5;
