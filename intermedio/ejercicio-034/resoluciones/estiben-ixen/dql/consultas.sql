-- Consultas para Ejercicio 034 - HAVING para garaje de motos
-- Concepto principal: HAVING
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre AS nombre,
    s.placa AS placa,
    s.id_propietario AS metrica
FROM propietarios_motos p
INNER JOIN estacionamiento_motos s ON p.id_propietario = s.modelo
ORDER BY s.id_propietario DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre AS entidad_principal,
    COUNT(s.id_estacionamiento) AS total_registros,
    AVG(s.id_propietario) AS promedio_metrica
FROM propietarios_motos p
INNER JOIN estacionamiento_motos s ON p.id_propietario = s.modelo
GROUP BY p.nombre
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre AS entidad_principal,
    COUNT(s.id_estacionamiento) AS total_registros,
    AVG(s.id_propietario) AS promedio_metrica
FROM propietarios_motos p
INNER JOIN estacionamiento_motos s ON p.id_propietario = s.modelo
GROUP BY p.nombre
HAVING COUNT(s.id_estacionamiento) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre AS entidad_principal,
    COALESCE(s.placa, 'Sin registros') AS detalle_asociado
FROM propietarios_motos p
LEFT JOIN estacionamiento_motos s ON p.id_propietario = s.modelo
ORDER BY p.nombre;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.placa,
    s.id_propietario,
    (SELECT p.nombre FROM propietarios_motos p WHERE p.id_propietario = s.modelo) AS entidad_origen
FROM estacionamiento_motos s
WHERE s.id_propietario > (SELECT AVG(id_propietario) FROM estacionamiento_motos)
ORDER BY s.id_propietario DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.placa AS nombre_elemento,
    p.nombre AS categoria_principal,
    s.id_propietario AS valor_destacado
FROM estacionamiento_motos s
INNER JOIN propietarios_motos p ON s.modelo = p.id_propietario
ORDER BY s.id_propietario DESC
LIMIT 5;
