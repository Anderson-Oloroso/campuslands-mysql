-- Ejercicio 018 - PRIMARY KEY para viajes y turismo
-- Ejecutar despues de inserts.sql

USE campuslands_mysql;

-- 1. Destinos con cupos disponibles, ordenados por fecha de salida
SELECT id_destino, nombre_destino, pais, cupos_disponibles, fecha_salida
FROM destinos_turisticos
WHERE cupos_disponibles > 0
ORDER BY fecha_salida ASC;

-- 2. Destinos agotados (sin cupos)
SELECT id_destino, nombre_destino, fecha_salida
FROM destinos_turisticos
WHERE cupos_disponibles = 0;

-- 3. Costo promedio de paquete por tipo de destino
SELECT tipo_destino,
       COUNT(*) AS total_destinos,
       ROUND(AVG(costo_paquete), 2) AS costo_promedio
FROM destinos_turisticos
GROUP BY tipo_destino
ORDER BY costo_promedio DESC;

-- 4. Top 5 destinos mas costosos
SELECT nombre_destino, pais, costo_paquete
FROM destinos_turisticos
ORDER BY costo_paquete DESC
LIMIT 5;

-- 5. Busqueda de un destino puntual por su PRIMARY KEY
SELECT id_destino, nombre_destino, pais, tipo_destino, costo_paquete
FROM destinos_turisticos
WHERE id_destino = 3;
