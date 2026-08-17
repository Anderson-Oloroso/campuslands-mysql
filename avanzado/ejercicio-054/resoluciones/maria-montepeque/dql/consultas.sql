USE campuslands_mysql;

-- 1. Estado actual del stock
SELECT nombre, unidad_medida, stock, stock_minimo, actualizado_en
FROM stock_soldadura_avanzado
ORDER BY stock ASC;

-- 2. Materiales por debajo o en su stock minimo (necesitan reabastecimiento)
SELECT nombre, stock, stock_minimo
FROM stock_soldadura_avanzado
WHERE stock <= stock_minimo;

-- 3. Locks activos en el servidor en este momento (vista de InnoDB).
-- Requiere el privilegio PROCESS, que el usuario 'campus' no tiene;
-- ejecutar como root (ver README). Solo mostrara filas si se corre
-- MIENTRAS otra sesion tiene una transaccion con FOR UPDATE abierta;
-- en una corrida normal y secuencial del script, la transaccion ya
-- habra hecho COMMIT y esta consulta devolvera 0 filas.
SELECT ENGINE_LOCK_ID, ENGINE_TRANSACTION_ID, LOCK_MODE, LOCK_STATUS, LOCK_DATA
FROM performance_schema.data_locks
WHERE OBJECT_NAME = 'stock_soldadura_avanzado';

-- 4. Transacciones actualmente activas (para inspeccionar bloqueos en
-- curso). Tambien requiere el privilegio PROCESS; ejecutar como root.
SELECT trx_id, trx_state, trx_started, trx_query
FROM information_schema.innodb_trx;

-- 5. Materiales con mayor stock actual
SELECT nombre, stock
FROM stock_soldadura_avanzado
ORDER BY stock DESC
LIMIT 3;

-- 6. Total de unidades en stock, agrupado por unidad de medida
SELECT unidad_medida, SUM(stock) AS stock_total
FROM stock_soldadura_avanzado
GROUP BY unidad_medida
ORDER BY stock_total DESC;

-- Nota de validacion manual (verificada al preparar esta resolucion):
-- se abrieron DOS conexiones simultaneas contra 'Electrodo E7018'
-- (id_material = 2):
--   Sesion A: START TRANSACTION; SELECT ... FOR UPDATE; SELECT SLEEP(4); UPDATE ...; COMMIT;
--   Sesion B (1 segundo despues): UPDATE stock_soldadura_avanzado SET stock = stock - 1 WHERE id_material = 2;
-- Resultado real: la sesion B quedo esperando desde las 17:45:35.218
-- hasta las 17:45:38.305 (unos 3.1 segundos), justo cuando la sesion A
-- hizo COMMIT, confirmando que FOR UPDATE bloquea la fila para otras
-- conexiones hasta que la transaccion termina.
