USE campuslands_mysql;

-- 1. Total de reservas y viajeros por categoria
SELECT categoria, COUNT(*) AS total_reservas, SUM(viajeros) AS total_viajeros
FROM reservas_intermedio
GROUP BY categoria
ORDER BY total_viajeros DESC;

-- 2. Ingreso total por categoria, solo reservas confirmadas
SELECT categoria, SUM(precio_total) AS ingresos_confirmados
FROM reservas_intermedio
WHERE estado = 'confirmada'
GROUP BY categoria
ORDER BY ingresos_confirmados DESC;

-- 3. Cantidad de reservas por mes de viaje
SELECT MONTHNAME(fecha_viaje) AS mes, COUNT(*) AS total_reservas
FROM reservas_intermedio
GROUP BY MONTH(fecha_viaje), MONTHNAME(fecha_viaje)
ORDER BY MONTH(fecha_viaje);

-- 4. Promedio de viajeros por destino
SELECT destino, AVG(viajeros) AS promedio_viajeros
FROM reservas_intermedio
GROUP BY destino
ORDER BY promedio_viajeros DESC;

-- 5. Cantidad de reservas por estado
SELECT estado, COUNT(*) AS total
FROM reservas_intermedio
GROUP BY estado
ORDER BY total DESC;

-- 6. Destinos con ingresos confirmados superiores a 1500 (GROUP BY + HAVING)
SELECT destino, SUM(precio_total) AS ingresos_confirmados
FROM reservas_intermedio
WHERE estado = 'confirmada'
GROUP BY destino
HAVING SUM(precio_total) > 1500
ORDER BY ingresos_confirmados DESC;
