-- Consultas demostrando el uso e importancia de la PRIMARY KEY.
USE campuslands_mysql;

-- 1. Busqueda directa y ultra rapida por Llave Primaria (Codigo de Reserva)
SELECT codigo_reserva, nombre_pasajero, destino, fecha_vuelo, clase 
    FROM basico_ejercicio_018_reservas 
    WHERE codigo_reserva = 'CZ33M4';

-- 2. Conteo de reservaciones agrupadas por destino (usando la PK para contar sin duplicados)
SELECT destino, COUNT(codigo_reserva) AS total_reservas 
    FROM basico_ejercicio_018_reservas 
    GROUP BY destino 
    ORDER BY total_reservas DESC;

-- 3. Listado de pasajeros que viajan en clase 'Ejecutiva' ordenados por fecha
SELECT codigo_reserva, nombre_pasajero, destino, fecha_vuelo 
    FROM basico_ejercicio_018_reservas 
    WHERE clase = 'Ejecutiva' 
    ORDER BY fecha_vuelo ASC;

-- 4. Busqueda por llave candidata (UNIQUE): Encontrar una reserva usando el numero de pasaporte
SELECT codigo_reserva, nombre_pasajero, numero_pasaporte, destino 
    FROM basico_ejercicio_018_reservas 
    WHERE numero_pasaporte = 'P987654321';

-- 5. Demostracion logica: Intentar insertar una reserva con un codigo que ya existe generara error.
/*
INSERT INTO basico_ejercicio_018_reservas (codigo_reserva, nombre_pasajero, numero_pasaporte, destino, fecha_vuelo) 
VALUES ('AX49P2', 'Pasajero Invalido', 'P000000000', 'Destino X', '2026-01-01');
-- ERROR 1062 (23000): Duplicate entry 'AX49P2' for key 'PRIMARY'
*/

-- Consultar todo el itinerario ordenado por la Llave Primaria alfabeticamente
SELECT codigo_reserva, nombre_pasajero, numero_pasaporte, destino, clase 
FROM basico_ejercicio_018_reservas 
ORDER BY codigo_reserva ASC;