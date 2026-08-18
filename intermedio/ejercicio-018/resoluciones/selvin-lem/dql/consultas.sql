-- Consultas con GROUP BY sobre reservas_viajes.
USE campuslands_mysql;

-- 1. Cantidad de reservas por destino
SELECT destino, COUNT(*) AS total_reservas
FROM reservas_viajes
GROUP BY destino
ORDER BY total_reservas DESC;

-- 2. Ingresos totales y promedio de dias por destino
SELECT destino,
       SUM(costo) AS ingresos_totales,
       ROUND(AVG(dias), 2) AS promedio_dias
FROM reservas_viajes
GROUP BY destino
ORDER BY ingresos_totales DESC;

-- 3. Total gastado por viajero, agrupando todos sus destinos
SELECT viajero, COUNT(*) AS reservas_realizadas, SUM(costo) AS total_gastado
FROM reservas_viajes
GROUP BY viajero
ORDER BY total_gastado DESC;

-- 4. Destino con mayor costo promedio por reserva
SELECT destino, ROUND(AVG(costo), 2) AS costo_promedio
FROM reservas_viajes
GROUP BY destino
ORDER BY costo_promedio DESC
LIMIT 1;

-- 5. Reservas agrupadas por destino y viajero (agrupacion de dos columnas)
SELECT destino, viajero, COUNT(*) AS reservas, SUM(dias) AS dias_totales
FROM reservas_viajes
GROUP BY destino, viajero
ORDER BY destino, viajero;
