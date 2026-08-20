-- Consultas para Ejercicio 019 - HAVING para paracaidismo
-- Concepto principal: HAVING
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre_zona AS nombre_zona,
    s.paracaidista AS paracaidista,
    s.altitud_salto_pies AS metrica
FROM zonas_salto p
INNER JOIN saltos_registrados s ON p.id_zona = s.id_zona
ORDER BY s.altitud_salto_pies DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre_zona AS entidad_principal,
    COUNT(s.id_salto) AS total_registros,
    AVG(s.altitud_salto_pies) AS promedio_metrica
FROM zonas_salto p
INNER JOIN saltos_registrados s ON p.id_zona = s.id_zona
GROUP BY p.nombre_zona
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre_zona AS entidad_principal,
    COUNT(s.id_salto) AS total_registros,
    AVG(s.altitud_salto_pies) AS promedio_metrica
FROM zonas_salto p
INNER JOIN saltos_registrados s ON p.id_zona = s.id_zona
GROUP BY p.nombre_zona
HAVING COUNT(s.id_salto) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre_zona AS entidad_principal,
    COALESCE(s.paracaidista, 'Sin registros') AS detalle_asociado
FROM zonas_salto p
LEFT JOIN saltos_registrados s ON p.id_zona = s.id_zona
ORDER BY p.nombre_zona;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.paracaidista,
    s.altitud_salto_pies,
    (SELECT p.nombre_zona FROM zonas_salto p WHERE p.id_zona = s.id_zona) AS entidad_origen
FROM saltos_registrados s
WHERE s.altitud_salto_pies > (SELECT AVG(altitud_salto_pies) FROM saltos_registrados)
ORDER BY s.altitud_salto_pies DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.paracaidista AS nombre_elemento,
    p.nombre_zona AS categoria_principal,
    s.altitud_salto_pies AS valor_destacado
FROM saltos_registrados s
INNER JOIN zonas_salto p ON s.id_zona = p.id_zona
ORDER BY s.altitud_salto_pies DESC
LIMIT 5;
