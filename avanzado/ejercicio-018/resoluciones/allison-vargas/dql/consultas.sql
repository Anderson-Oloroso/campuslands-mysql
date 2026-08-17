-- DQL: Consultas de reporte aprovechando las funciones de fecha y cálculo creadas
USE campuslands_mysql;

-- 1. Detalle de reservas con cálculo explícito de días de estadía mediante la función
SELECT 
    r.reserva_id,
    r.cliente_nombre,
    p.destino,
    p.categoria,
    r.fecha_inicio,
    r.fecha_fin,
    calcular_dias_viaje(r.fecha_inicio, r.fecha_fin) AS noches_estadia,
    r.numero_personas,
    r.monto_total
FROM reservas_turismo r
INNER JOIN paquetes_turismo p ON r.paquete_id = p.paquete_id
ORDER BY r.fecha_inicio ASC;

-- 2. Ingresos generados agrupados por categoría de turismo
SELECT 
    p.categoria,
    COUNT(r.reserva_id) AS total_reservas,
    SUM(r.numero_personas) AS total_turistas,
    ROUND(SUM(r.monto_total), 2) AS ingresos_totales_usd
FROM paquetes_turismo p
INNER JOIN reservas_turismo r ON p.paquete_id = r.paquete_id
GROUP BY p.categoria
ORDER BY ingresos_totales_usd DESC;

-- 3. Promedio de noches contratadas por destino
SELECT 
    p.destino,
    ROUND(AVG(calcular_dias_viaje(r.fecha_inicio, r.fecha_fin)), 1) AS promedio_noches
FROM paquetes_turismo p
INNER JOIN reservas_turismo r ON p.paquete_id = r.paquete_id
GROUP BY p.paquete_id, p.destino
ORDER BY promedio_noches DESC;

-- 4. Top 3 reservas con mayor volumen de facturación
SELECT 
    r.cliente_nombre,
    p.destino,
    r.numero_personas,
    r.monto_total AS precio_final_con_descuento
FROM reservas_turismo r
INNER JOIN paquetes_turismo p ON r.paquete_id = p.paquete_id
ORDER BY r.monto_total DESC
LIMIT 3;

-- 5. Resumen consolidado de la agencia
SELECT 
    COUNT(reserva_id) AS reservas_totales,
    SUM(numero_personas) AS personas_atendidas,
    ROUND(AVG(monto_total), 2) AS ticket_promedio_usd,
    ROUND(SUM(monto_total), 2) AS facturacion_global_usd
FROM reservas_turismo;
