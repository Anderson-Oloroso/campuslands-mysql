-- Consultas para Ejercicio 048 - GROUP BY para viajes y turismo
-- Concepto principal: GROUP BY
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.ciudad AS ciudad,
    s.nombre_paquete AS nombre_paquete,
    s.precio_por_persona AS metrica
FROM destinos_turisticos p
INNER JOIN paquetes_turisticos s ON p.id_destino = s.id_destino
ORDER BY s.precio_por_persona DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.ciudad AS entidad_principal,
    COUNT(s.id_paquete) AS total_registros,
    AVG(s.precio_por_persona) AS promedio_metrica
FROM destinos_turisticos p
INNER JOIN paquetes_turisticos s ON p.id_destino = s.id_destino
GROUP BY p.ciudad
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.ciudad AS entidad_principal,
    COUNT(s.id_paquete) AS total_registros,
    AVG(s.precio_por_persona) AS promedio_metrica
FROM destinos_turisticos p
INNER JOIN paquetes_turisticos s ON p.id_destino = s.id_destino
GROUP BY p.ciudad
HAVING COUNT(s.id_paquete) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.ciudad AS entidad_principal,
    COALESCE(s.nombre_paquete, 'Sin registros') AS detalle_asociado
FROM destinos_turisticos p
LEFT JOIN paquetes_turisticos s ON p.id_destino = s.id_destino
ORDER BY p.ciudad;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.nombre_paquete,
    s.precio_por_persona,
    (SELECT p.ciudad FROM destinos_turisticos p WHERE p.id_destino = s.id_destino) AS entidad_origen
FROM paquetes_turisticos s
WHERE s.precio_por_persona > (SELECT AVG(precio_por_persona) FROM paquetes_turisticos)
ORDER BY s.precio_por_persona DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.nombre_paquete AS nombre_elemento,
    p.ciudad AS categoria_principal,
    s.precio_por_persona AS valor_destacado
FROM paquetes_turisticos s
INNER JOIN destinos_turisticos p ON s.id_destino = p.id_destino
ORDER BY s.precio_por_persona DESC
LIMIT 5;
