USE campuslands_mysql;

-- 1. Total reservado e ingresos por destino
SELECT destino, COUNT(*) AS total_reservas, SUM(precio) AS ingresos
FROM reservas_viajes_intermedio
GROUP BY destino
ORDER BY ingresos DESC;

-- 2. Ingresos por categoria, solo las que superan 2000000 en total (GROUP BY + HAVING)
SELECT categoria, SUM(precio) AS ingresos
FROM reservas_viajes_intermedio
GROUP BY categoria
HAVING SUM(precio) > 2000000
ORDER BY ingresos DESC;

-- 3. Reservas por mes
SELECT MONTHNAME(fecha_reserva) AS mes, COUNT(*) AS total_reservas, SUM(precio) AS ingresos
FROM reservas_viajes_intermedio
GROUP BY MONTH(fecha_reserva), MONTHNAME(fecha_reserva)
ORDER BY MONTH(fecha_reserva);

-- 4. Paquete mas reservado por cantidad de transacciones
SELECT nombre_paquete, COUNT(*) AS veces_reservado
FROM reservas_viajes_intermedio
GROUP BY nombre_paquete
ORDER BY veces_reservado DESC
LIMIT 3;

-- 5. Total gastado por cliente
SELECT cliente, SUM(precio) AS total_gastado
FROM reservas_viajes_intermedio
GROUP BY cliente
ORDER BY total_gastado DESC;

-- 6. Clientes con mas de una reserva (GROUP BY + HAVING)
SELECT cliente, COUNT(*) AS total_reservas
FROM reservas_viajes_intermedio
GROUP BY cliente
HAVING COUNT(*) > 1
ORDER BY total_reservas DESC;
