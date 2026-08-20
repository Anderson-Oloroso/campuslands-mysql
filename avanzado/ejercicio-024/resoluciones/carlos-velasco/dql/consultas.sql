-- ============================================================
-- Ejercicio 024 - Consultas y bloqueos
-- ============================================================

USE campuslands_mysql;


-- ------------------------------------------------------------
-- Consulta 1
-- Trabajos pendientes ordenados por costo.
-- ------------------------------------------------------------
SELECT
    t.id_trabajo,
    t.cliente,
    s.nombre AS soldador,
    t.tipo_soldadura,
    t.material,
    t.costo_estimado,
    t.estado
FROM trabajos_soldadura AS t
INNER JOIN soldadores AS s
    ON s.id_soldador = t.id_soldador
WHERE t.estado = 'pendiente'
ORDER BY t.costo_estimado DESC;


-- ------------------------------------------------------------
-- Consulta 2
-- Cantidad y costo total de trabajos por estado.
-- ------------------------------------------------------------
SELECT
    estado,
    COUNT(*) AS total_trabajos,
    SUM(costo_estimado) AS costo_total,
    AVG(costo_estimado) AS costo_promedio
FROM trabajos_soldadura
GROUP BY estado
ORDER BY costo_total DESC;


-- ------------------------------------------------------------
-- Consulta 3
-- Trabajos asignados a cada soldador.
-- ------------------------------------------------------------
SELECT
    s.nombre AS soldador,
    s.especialidad,
    COUNT(t.id_trabajo) AS total_trabajos,
    SUM(t.horas_estimadas) AS horas_totales
FROM soldadores AS s
LEFT JOIN trabajos_soldadura AS t
    ON t.id_soldador = s.id_soldador
GROUP BY
    s.id_soldador,
    s.nombre,
    s.especialidad
ORDER BY total_trabajos DESC;


-- ------------------------------------------------------------
-- Consulta 4
-- Trabajos que utilizan materiales de mayor demanda.
-- ------------------------------------------------------------
SELECT
    material,
    COUNT(*) AS cantidad_trabajos,
    SUM(costo_estimado) AS costo_total
FROM trabajos_soldadura
GROUP BY material
ORDER BY cantidad_trabajos DESC, costo_total DESC;


-- ------------------------------------------------------------
-- Consulta 5
-- Top 5 trabajos por costo estimado.
-- ------------------------------------------------------------
SELECT
    t.id_trabajo,
    t.cliente,
    s.nombre AS soldador,
    t.material,
    t.costo_estimado,
    RANK() OVER (
        ORDER BY t.costo_estimado DESC
    ) AS posicion
FROM trabajos_soldadura AS t
INNER JOIN soldadores AS s
    ON s.id_soldador = t.id_soldador
ORDER BY posicion
LIMIT 5;


-- ============================================================
-- BLOQUEOS DE FILAS
-- ============================================================


-- ------------------------------------------------------------
-- Consulta 6
-- Bloqueo pesimista de una fila mediante FOR UPDATE.
--
-- Debe ejecutarse dentro de una transacción.
-- La fila seleccionada queda bloqueada para modificaciones
-- de otras transacciones hasta COMMIT o ROLLBACK.
-- ------------------------------------------------------------
START TRANSACTION;

SELECT
    id_trabajo,
    cliente,
    estado,
    costo_estimado
FROM trabajos_soldadura
WHERE id_trabajo = 1
FOR UPDATE;


-- Después de comprobar el bloqueo:
COMMIT;


-- ------------------------------------------------------------
-- Consulta 7
-- Bloqueo de lectura compartida.
--
-- Permite comprobar el uso de una lectura con bloqueo
-- dentro de una transacción.
-- ------------------------------------------------------------
START TRANSACTION;

SELECT
    id_trabajo,
    cliente,
    material,
    estado
FROM trabajos_soldadura
WHERE id_trabajo = 2
FOR SHARE;

COMMIT;


-- ------------------------------------------------------------
-- Consulta 8
-- Actualización de un registro después de obtener
-- el bloqueo de la fila.
-- ------------------------------------------------------------
START TRANSACTION;

SELECT
    id_trabajo,
    estado
FROM trabajos_soldadura
WHERE id_trabajo = 3
FOR UPDATE;

UPDATE trabajos_soldadura
SET estado = 'en_proceso'
WHERE id_trabajo = 3;

COMMIT;


-- ------------------------------------------------------------
-- Consulta 9
-- Verificar el estado posterior a la actualización.
-- ------------------------------------------------------------
SELECT
    id_trabajo,
    cliente,
    estado,
    costo_estimado
FROM trabajos_soldadura
WHERE id_trabajo = 3;


-- ------------------------------------------------------------
-- Consulta 10
-- Mostrar las transacciones actuales del servidor.
-- Puede utilizarse como evidencia durante una prueba
-- de bloqueo entre dos conexiones.
-- ------------------------------------------------------------
SELECT
    trx_id,
    trx_state,
    trx_started,
    trx_mysql_thread_id
FROM information_schema.innodb_trx;