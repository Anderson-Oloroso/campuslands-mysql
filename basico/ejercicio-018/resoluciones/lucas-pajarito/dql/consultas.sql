USE basico_viajes_turismo;

-- Consulta 1: Consultar destinos utilizando la PRIMARY KEY (Búsqueda directa por ID)
SELECT * FROM destinos_018 
WHERE id = 1;

-- Consulta 2: Consultar información de un turista por su clave primaria (Pasaporte)
SELECT * FROM turistas_018 
WHERE pasaporte = 'PAS-A1234567';

-- Consulta 3: Obtener todos los tours ordenados por su ID de clave primaria
SELECT id, nombre_tour, duracion_dias 
FROM tours_018 
ORDER BY id ASC;

-- Consulta 4: Validar reservas existentes consultando los campos de la PRIMARY KEY compuesta
SELECT tour_id, turista_pasaporte, fecha_reserva, monto_total 
FROM reservas_018;

-- Consulta 5: Contar el total de destinos únicos registrados en el sistema
SELECT COUNT(id) AS total_destinos FROM destinos_018;

-- Consulta 6: Listar las reservas agrupadas por pasaporte de turista
SELECT 
    turista_pasaporte, 
    COUNT(*) AS total_reservas, 
    SUM(monto_total) AS total_invertido
FROM reservas_018 
GROUP BY turista_pasaporte;

-- Consulta 7: Obtener el tour con la mayor duración utilizando agregación
SELECT nombre_tour, duracion_dias 
FROM tours_018 
ORDER BY duracion_dias DESC 
LIMIT 1;

-- Consulta 8: Calcular el promedio de ingresos por reserva registrada
SELECT AVG(monto_total) AS promedio_por_reserva FROM reservas_018;