-- ============================================================
-- EJERCICIO 019 - INSERT PARA PARACAIDISMO
-- Archivo: dql/consultas.sql
-- Motor: MySQL
-- ============================================================

USE campuslands_mysql;

-- ============================================================
-- CONSULTA 1
-- Mostrar todos los saltos completados.
-- ============================================================

SELECT
    id_salto,
    nombre_paracaidista AS paracaidista,
    modalidad,
    altura_salto,
    duracion_caida,
    fecha_salto
FROM saltos
WHERE estado = 'completado'
ORDER BY fecha_salto ASC;


-- ============================================================
-- CONSULTA 2
-- Mostrar los saltos ordenados de mayor a menor altura.
-- ============================================================

SELECT
    id_salto,
    nombre_paracaidista AS paracaidista,
    modalidad,
    altura_salto AS altura,
    estado
FROM saltos
ORDER BY altura_salto DESC;


-- ============================================================
-- CONSULTA 3
-- Mostrar los 5 saltos con mayor altura.
-- ============================================================

SELECT
    id_salto,
    nombre_paracaidista AS paracaidista,
    modalidad,
    altura_salto AS altura,
    duracion_caida
FROM saltos
ORDER BY altura_salto DESC
LIMIT 5;


-- ============================================================
-- CONSULTA 4
-- Contar saltos registrados por modalidad.
-- ============================================================

SELECT
    modalidad,
    COUNT(*) AS total_saltos
FROM saltos
GROUP BY modalidad
ORDER BY total_saltos DESC;


-- ============================================================
-- CONSULTA 5
-- Calcular la duración promedio de caída por modalidad.
-- ============================================================

SELECT
    modalidad,
    COUNT(*) AS total_saltos,
    ROUND(AVG(duracion_caida), 2) AS duracion_promedio
FROM saltos
GROUP BY modalidad
ORDER BY duracion_promedio DESC;


-- ============================================================
-- CONSULTA 6
-- Obtener estadísticas generales de altura.
-- ============================================================

SELECT
    COUNT(*) AS total_saltos,
    MIN(altura_salto) AS altura_minima,
    MAX(altura_salto) AS altura_maxima,
    ROUND(AVG(altura_salto), 2) AS altura_promedio
FROM saltos;


-- ============================================================
-- CONSULTA 7
-- Mostrar saltos con altura igual o superior a 4500 metros.
-- ============================================================

SELECT
    id_salto,
    nombre_paracaidista AS paracaidista,
    modalidad,
    altura_salto AS altura,
    estado
FROM saltos
WHERE altura_salto >= 4500
ORDER BY altura_salto DESC;


-- ============================================================
-- CONSULTA 8
-- Mostrar modalidades con al menos 3 saltos registrados.
-- ============================================================

SELECT
    modalidad,
    COUNT(*) AS total_saltos,
    ROUND(AVG(altura_salto), 2) AS altura_promedio
FROM saltos
GROUP BY modalidad
HAVING COUNT(*) >= 3
ORDER BY total_saltos DESC;