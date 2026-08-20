USE campuslands_mysql;

-- 1. Total facturado y cantidad de personas por país de destino (Solo reservas confirmadas)
SELECT 
    d.pais AS destino_pais,
    COUNT(r.id) AS total_reservas,
    SUM(r.cantidad_personas) AS total_turistas,
    SUM(r.monto_total) AS ingresos_totales
FROM reservas r
INNER JOIN paquetes_turisticos p ON r.paquete_id = p.id
INNER JOIN destinos d ON p.destino_id = d.id
WHERE r.estado = 'Confirmada'
GROUP BY d.pais
ORDER BY ingresos_totales DESC;

-- 2. Promedio de precio y total de paquetes ofertados según la categoría de viaje
SELECT 
    categoria,
    COUNT(*) AS total_paquetes,
    AVG(precio_persona) AS precio_promedio_persona,
    MIN(precio_persona) AS precio_minimo,
    MAX(precio_persona) AS precio_maximo
FROM paquetes_turisticos
GROUP BY categoria
ORDER BY precio_promedio_persona DESC;

-- 3. Agrupación por estado de reserva con cálculo de volumen y montos acumulados
SELECT 
    estado,
    COUNT(*) AS cantidad_reservas,
    SUM(monto_total) AS total_monto
FROM reservas
GROUP BY estado;

-- 4. Ranking de clientes con mayor gasto acumulado en la agencia (Uso de HAVING para filtrar montos >= 1000)
SELECT 
    c.id AS cliente_id,
    CONCAT(c.nombre, ' ', c.apellido) AS cliente,
    c.nacionalidad,
    COUNT(r.id) AS reservas_confirmadas,
    SUM(r.monto_total) AS total_invertido
FROM clientes c
INNER JOIN reservas r ON c.id = r.cliente_id
WHERE r.estado = 'Confirmada'
GROUP BY c.id, c.nombre, c.apellido, c.nacionalidad
HAVING SUM(r.monto_total) >= 1000.00
ORDER BY total_invertido DESC;

-- 5. Promedio de duración en días y total de reservas por región de destino
SELECT 
    d.region,
    COUNT(r.id) AS total_reservas,
    AVG(p.duracion_dias) AS promedio_dias_estancia,
    AVG(r.monto_total) AS ticket_promedio_reserva
FROM destinos d
INNER JOIN paquetes_turisticos p ON d.id = p.destino_id
LEFT JOIN reservas r ON p.id = r.paquete_id AND r.estado = 'Confirmada'
GROUP BY d.region
ORDER BY total_reservas DESC;