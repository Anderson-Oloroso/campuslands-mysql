USE campuslands_mysql;


/* =========================================================
   1. Consultar todas las órdenes
   ========================================================= */

SELECT
    id_orden,
    cliente,
    tipo_soldadura,
    material,
    peso_kg,
    costo,
    estado,
    fecha_orden
FROM ordenes_soldadura
ORDER BY fecha_orden;


/* =========================================================
   2. Consultar órdenes que están en proceso
   ========================================================= */

SELECT
    id_orden,
    cliente,
    tipo_soldadura,
    material,
    costo
FROM ordenes_soldadura
WHERE estado = 'en_proceso'
ORDER BY costo DESC;


/* =========================================================
   3. Consultar las órdenes de mayor costo
   ========================================================= */

SELECT
    id_orden,
    cliente,
    material,
    costo,
    estado
FROM ordenes_soldadura
ORDER BY costo DESC
LIMIT 5;


/* =========================================================
   4. Resumen de órdenes por estado
   ========================================================= */

SELECT
    estado,
    COUNT(*) AS total_ordenes,
    SUM(costo) AS costo_total,
    AVG(costo) AS costo_promedio
FROM ordenes_soldadura
GROUP BY estado
ORDER BY total_ordenes DESC;


/* =========================================================
   5. BLOQUEO PESIMISTA
   =========================================================
   Bloquea la orden 1 para evitar que otra transacción
   pueda modificarla mientras esta transacción permanezca abierta.
   ========================================================= */

START TRANSACTION;

SELECT
    id_orden,
    cliente,
    estado,
    costo
FROM ordenes_soldadura
WHERE id_orden = 1
FOR UPDATE;

-- Realizar aquí la operación necesaria sobre la orden.

COMMIT;


/* =========================================================
   6. BLOQUEO PESIMISTA SOBRE UNA ORDEN PENDIENTE
   ========================================================= */

START TRANSACTION;

SELECT
    id_orden,
    cliente,
    estado,
    costo
FROM ordenes_soldadura
WHERE id_orden = 2
  AND estado = 'pendiente'
FOR UPDATE;

-- Después de verificar el registro puede realizarse
-- una actualización dentro de la misma transacción.

UPDATE ordenes_soldadura
SET estado = 'en_proceso'
WHERE id_orden = 2
  AND estado = 'pendiente';

COMMIT;


/* =========================================================
   7. BLOQUEO COMPARTIDO
   =========================================================
   Permite consultar la fila manteniendo un bloqueo compartido
   durante la transacción.
   ========================================================= */

START TRANSACTION;

SELECT
    id_orden,
    cliente,
    tipo_soldadura,
    material,
    costo
FROM ordenes_soldadura
WHERE id_orden = 3
FOR SHARE;

COMMIT;


/* =========================================================
   8. Actualización controlada dentro de una transacción
   ========================================================= */

START TRANSACTION;

SELECT
    id_orden,
    cliente,
    estado
FROM ordenes_soldadura
WHERE id_orden = 4
FOR UPDATE;

UPDATE ordenes_soldadura
SET estado = 'en_proceso'
WHERE id_orden = 4;

COMMIT;


/* =========================================================
   9. Verificar el estado final de las órdenes modificadas
   ========================================================= */

SELECT
    id_orden,
    cliente,
    estado
FROM ordenes_soldadura
WHERE id_orden IN (1, 2, 3, 4)
ORDER BY id_orden;