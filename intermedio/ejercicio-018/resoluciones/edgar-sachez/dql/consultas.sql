-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;
SELECT 
    p.nombre_pais,
    p.continente,
    COUNT(r.reserva_id) AS total_reservas,
    COALESCE(SUM(r.dias_estancia), 0) AS total_dias_reservados,
    COALESCE(SUM(r.monto_total_usd), 0.00) AS ingresos_totales_usd,
    COALESCE(ROUND(AVG(r.monto_total_usd), 2), 0.00) AS ticket_promedio_usd
FROM paises_turismo p
INNER JOIN destinos_turismo d ON p.pais_id = d.pais_id
LEFT JOIN reservas_turismo r ON d.destino_id = r.destino_id AND r.estado_reserva IN ('Confirmada', 'Completada')
GROUP BY p.pais_id, p.nombre_pais, p.continente
ORDER BY ingresos_totales_usd DESC;

SELECT 
    d.tipo_destino,
    COUNT(DISTINCT d.destino_id) AS cantidad_destinos_ofrecidos,
    COUNT(r.reserva_id) AS reservas_efectivas,
    COALESCE(SUM(r.monto_total_usd), 0.00) AS recaudacion_total_usd,
    COALESCE(ROUND(AVG(r.dias_estancia), 1), 0.0) AS promedio_dias_estancia
FROM destinos_turismo d
LEFT JOIN reservas_turismo r ON d.destino_id = r.destino_id AND r.estado_reserva IN ('Confirmada', 'Completada')
GROUP BY d.tipo_destino
HAVING reservas_efectivas > 0
ORDER BY recaudacion_total_usd DESC;
