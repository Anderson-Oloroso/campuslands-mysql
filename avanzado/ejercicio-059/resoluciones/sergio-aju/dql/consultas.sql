USE campuslands_mysql;

-- 1. Estado y configuración del Event Scheduler en la base de datos
SELECT 
    EVENT_NAME,
    STATUS,
    EVENT_TYPE,
    INTERVAL_VALUE,
    INTERVAL_FIELD,
    LAST_EXECUTED
FROM information_schema.EVENTS
WHERE EVENT_SCHEMA = 'campuslands_mysql';

-- 2. Diagnóstico manual para simular los efectos de los eventos programados
-- Muestra promociones que deberían caducar
SELECT 
    id,
    nombre,
    precio,
    descuento_porcentaje,
    fecha_fin_promocion,
    IF(fecha_fin_promocion <= NOW(), 'VENCIDA', 'VIGENTE') AS estado_oferta
FROM productos_accesorios
WHERE en_promocion = 1;

-- 3. Análisis de carritos por estado (detecta tasas de abandono)
SELECT 
    estado,
    COUNT(*) AS total_carritos,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM carritos_compras), 2) AS porcentaje
FROM carritos_compras
GROUP BY estado
ORDER BY total_carritos DESC;

-- 4. Simulación del cierre del día actual (Lo que ejecutará el evento `evt_resumen_diario_ventas`)
SELECT 
    DATE(fecha_pedido) AS fecha_cierre,
    COUNT(id) AS cantidad_pedidos,
    SUM(total) AS ingresos_totales,
    ROUND(AVG(total), 2) AS ticket_promedio
FROM pedidos
WHERE estado = 'Completado'
GROUP BY DATE(fecha_pedido)
ORDER BY fecha_cierre DESC;

-- 5. Bitácora de ejecución de auditoría generada por los eventos
SELECT 
    id,
    nombre_evento,
    filas_afectadas,
    detalles,
    ejecutado_en
FROM auditoria_eventos
ORDER BY ejecutado_en DESC;