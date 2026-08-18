-- Consultas para Ejercicio 040 - UNIQUE para carreras urbanas
-- Concepto principal: UNIQUE
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.apodo AS apodo,
    s.modelo AS modelo,
    s.potencia_hp AS metrica
FROM pilotos_urbanos p
INNER JOIN vehiculos_tuning s ON p.id_piloto = s.id_piloto
ORDER BY s.potencia_hp DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.apodo AS entidad_principal,
    COUNT(s.id_vehiculo) AS total_registros,
    AVG(s.potencia_hp) AS promedio_metrica
FROM pilotos_urbanos p
INNER JOIN vehiculos_tuning s ON p.id_piloto = s.id_piloto
GROUP BY p.apodo
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.apodo AS entidad_principal,
    COUNT(s.id_vehiculo) AS total_registros,
    AVG(s.potencia_hp) AS promedio_metrica
FROM pilotos_urbanos p
INNER JOIN vehiculos_tuning s ON p.id_piloto = s.id_piloto
GROUP BY p.apodo
HAVING COUNT(s.id_vehiculo) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.apodo AS entidad_principal,
    COALESCE(s.modelo, 'Sin registros') AS detalle_asociado
FROM pilotos_urbanos p
LEFT JOIN vehiculos_tuning s ON p.id_piloto = s.id_piloto
ORDER BY p.apodo;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.modelo,
    s.potencia_hp,
    (SELECT p.apodo FROM pilotos_urbanos p WHERE p.id_piloto = s.id_piloto) AS entidad_origen
FROM vehiculos_tuning s
WHERE s.potencia_hp > (SELECT AVG(potencia_hp) FROM vehiculos_tuning)
ORDER BY s.potencia_hp DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.modelo AS nombre_elemento,
    p.apodo AS categoria_principal,
    s.potencia_hp AS valor_destacado
FROM vehiculos_tuning s
INNER JOIN pilotos_urbanos p ON s.id_piloto = p.id_piloto
ORDER BY s.potencia_hp DESC
LIMIT 5;
