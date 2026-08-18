-- Consultas para Ejercicio 036 - normalizacion 1FN para autos hiperdeportivos
-- Concepto principal: normalizacion 1FN
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.marca AS marca,
    s.modelo AS modelo,
    s.velocidad_max AS metrica
FROM fabricantes_autos p
INNER JOIN autos_hiperdeportivos s ON p.id_fabricante = s.id_fabricante
ORDER BY s.velocidad_max DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.marca AS entidad_principal,
    COUNT(s.id_auto) AS total_registros,
    AVG(s.velocidad_max) AS promedio_metrica
FROM fabricantes_autos p
INNER JOIN autos_hiperdeportivos s ON p.id_fabricante = s.id_fabricante
GROUP BY p.marca
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.marca AS entidad_principal,
    COUNT(s.id_auto) AS total_registros,
    AVG(s.velocidad_max) AS promedio_metrica
FROM fabricantes_autos p
INNER JOIN autos_hiperdeportivos s ON p.id_fabricante = s.id_fabricante
GROUP BY p.marca
HAVING COUNT(s.id_auto) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.marca AS entidad_principal,
    COALESCE(s.modelo, 'Sin registros') AS detalle_asociado
FROM fabricantes_autos p
LEFT JOIN autos_hiperdeportivos s ON p.id_fabricante = s.id_fabricante
ORDER BY p.marca;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.modelo,
    s.velocidad_max,
    (SELECT p.marca FROM fabricantes_autos p WHERE p.id_fabricante = s.id_fabricante) AS entidad_origen
FROM autos_hiperdeportivos s
WHERE s.velocidad_max > (SELECT AVG(velocidad_max) FROM autos_hiperdeportivos)
ORDER BY s.velocidad_max DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.modelo AS nombre_elemento,
    p.marca AS categoria_principal,
    s.velocidad_max AS valor_destacado
FROM autos_hiperdeportivos s
INNER JOIN fabricantes_autos p ON s.id_fabricante = p.id_fabricante
ORDER BY s.velocidad_max DESC
LIMIT 5;
