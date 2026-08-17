USE campuslands_mysql;


-- 1. Mostrar todos los saltos registrados.
SELECT
    id_salto,
    nombre_participante,
    modalidad,
    altura_salto,
    precio,
    fecha_salto,
    experiencia_nivel,
    estado
FROM saltos
ORDER BY fecha_salto ASC;


-- 2. Mostrar los saltos actualmente programados.
SELECT
    nombre_participante,
    modalidad,
    fecha_salto,
    altura_salto,
    precio
FROM saltos
WHERE estado = 'programado'
ORDER BY fecha_salto ASC;


-- 3. Mostrar saltos realizados por participantes avanzados.
SELECT
    nombre_participante,
    modalidad,
    altura_salto,
    fecha_salto,
    precio
FROM saltos
WHERE estado = 'realizado'
  AND experiencia_nivel = 'avanzado'
ORDER BY precio DESC;


-- 4. Mostrar los saltos con precio superior a 300.
SELECT
    nombre_participante,
    modalidad,
    precio
FROM saltos
WHERE precio > 300
ORDER BY precio DESC;


-- 5. Calcular el ingreso potencial de los saltos programados.
SELECT
    COUNT(*) AS saltos_programados,
    ROUND(SUM(precio), 2) AS ingreso_potencial
FROM saltos
WHERE estado = 'programado';


-- 6. Obtener el precio promedio por modalidad.
SELECT
    modalidad,
    COUNT(*) AS total_saltos,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM saltos
GROUP BY modalidad
ORDER BY precio_promedio DESC;


-- 7. Obtener el Top 5 de saltos con mayor altura.
SELECT
    nombre_participante,
    modalidad,
    altura_salto,
    fecha_salto
FROM saltos
ORDER BY altura_salto DESC
LIMIT 5;