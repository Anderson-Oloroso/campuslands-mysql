USE campuslands_mysql;

-- 1. Verificar que el Event Scheduler está habilitado.
SELECT
    @@event_scheduler AS event_scheduler_estado;


-- 2. Consultar los eventos creados en la base de datos.
SHOW EVENTS FROM campuslands_mysql;


-- 3. Mostrar los productos activos con su stock y última actualización.
SELECT
    id_producto,
    nombre,
    categoria,
    precio,
    stock,
    ultima_actualizacion
FROM productos
WHERE estado = 'activo'
ORDER BY stock ASC;


-- 4. Identificar productos activos sin movimiento durante
-- más de 30 días.
SELECT
    p.id_producto,
    p.nombre,
    p.categoria,
    p.stock,
    p.ultima_actualizacion
FROM productos AS p
WHERE p.estado = 'activo'
  AND p.ultima_actualizacion < NOW() - INTERVAL 30 DAY
ORDER BY p.ultima_actualizacion ASC;


-- 5. Consultar el historial de movimientos de inventario.
SELECT
    p.nombre AS producto,
    m.tipo_movimiento,
    m.cantidad,
    m.fecha_movimiento
FROM movimientos_inventario AS m
INNER JOIN productos AS p
    ON m.id_producto = p.id_producto
ORDER BY m.fecha_movimiento DESC;


-- 6. Calcular el total de movimientos registrados por producto.
SELECT
    p.nombre AS producto,
    COUNT(m.id_movimiento) AS total_movimientos,
    COALESCE(SUM(m.cantidad), 0) AS unidades_movidas
FROM productos AS p
LEFT JOIN movimientos_inventario AS m
    ON p.id_producto = m.id_producto
GROUP BY
    p.id_producto,
    p.nombre
ORDER BY unidades_movidas DESC;


-- 7. Consultar las alertas generadas por el Event Scheduler.
SELECT
    a.id_alerta,
    p.nombre AS producto,
    a.tipo_alerta,
    a.mensaje,
    a.fecha_alerta
FROM alertas_inventario AS a
INNER JOIN productos AS p
    ON a.id_producto = p.id_producto
ORDER BY a.fecha_alerta DESC;


-- 8. Mostrar los productos con stock bajo.
SELECT
    id_producto,
    nombre,
    categoria,
    stock,
    precio
FROM productos
WHERE estado = 'activo'
  AND stock <= 10
ORDER BY stock ASC;