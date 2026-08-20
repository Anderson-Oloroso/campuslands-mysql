-- ============================================================
-- Ejercicio 029 - Consultas
-- ============================================================

USE campuslands_mysql;


-- ============================================================
-- Consulta 1
-- Mostrar todos los productos ordenados por precio.
-- ============================================================

SELECT
    id_producto,
    nombre,
    categoria,
    precio,
    stock,
    estado
FROM productos
ORDER BY precio DESC;


-- ============================================================
-- Consulta 2
-- Mostrar productos activos disponibles para venta.
-- ============================================================

SELECT
    id_producto,
    nombre,
    categoria,
    precio,
    stock
FROM productos
WHERE estado = 'activo'
  AND stock > 0
ORDER BY stock DESC;


-- ============================================================
-- Consulta 3
-- Identificar productos sin stock.
-- Estos productos son candidatos a ser desactivados
-- por el Event Scheduler.
-- ============================================================

SELECT
    id_producto,
    nombre,
    categoria,
    stock,
    estado
FROM productos
WHERE stock = 0
ORDER BY nombre;


-- ============================================================
-- Consulta 4
-- Obtener indicadores por categoria.
-- ============================================================

SELECT
    categoria,
    COUNT(*) AS total_productos,
    SUM(stock) AS unidades_disponibles,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM productos
GROUP BY categoria
ORDER BY total_productos DESC;


-- ============================================================
-- Consulta 5
-- Ranking de productos por valor de inventario.
-- ============================================================

SELECT
    id_producto,
    nombre,
    categoria,
    precio,
    stock,
    ROUND(precio * stock, 2) AS valor_inventario
FROM productos
ORDER BY valor_inventario DESC
LIMIT 5;


-- ============================================================
-- Consulta 6
-- Mostrar productos con precio superior al promedio general.
-- ============================================================

SELECT
    id_producto,
    nombre,
    categoria,
    precio
FROM productos
WHERE precio > (
    SELECT AVG(precio)
    FROM productos
)
ORDER BY precio DESC;


-- ============================================================
-- Consulta 7
-- Consultar el historial generado por el Event Scheduler.
-- ============================================================

SELECT
    h.id_historial,
    p.nombre AS producto,
    h.estado_anterior,
    h.estado_nuevo,
    h.motivo,
    h.fecha_cambio
FROM historial_productos AS h
INNER JOIN productos AS p
    ON p.id_producto = h.id_producto
ORDER BY h.fecha_cambio DESC;


-- ============================================================
-- Consulta 8
-- Verificar la existencia y configuración del evento.
-- ============================================================

SELECT
    EVENT_NAME AS nombre_evento,
    STATUS AS estado_evento,
    EVENT_TYPE AS tipo_evento,
    EXECUTE_AT AS ejecucion_unica,
    INTERVAL_VALUE AS intervalo,
    INTERVAL_FIELD AS unidad_intervalo
FROM information_schema.EVENTS
WHERE EVENT_SCHEMA = DATABASE()
  AND EVENT_NAME = 'ev_desactivar_productos_sin_stock';