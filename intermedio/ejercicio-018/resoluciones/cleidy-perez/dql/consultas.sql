-- Consultas base. Completa o reemplaza segun el enunciado.
-- 1. Métricas de ventas agrupadas por Destino
USE agencia_viajes;
SELECT 
    p.destino,
    COUNT(r.reserva_id) AS total_reservas,
    SUM(r.personas) AS total_turistas,
    ROUND(AVG(r.noches), 1) AS promedio_noches,
    SUM((p.precio_por_noche * r.noches * r.personas) * (1 - (p.descuento_porcentaje / 100))) AS ingresos_totales
FROM paquetes_turisticos p
LEFT JOIN reservas r ON p.paquete_id = r.paquete_id
GROUP BY p.paquete_id, p.destino;
