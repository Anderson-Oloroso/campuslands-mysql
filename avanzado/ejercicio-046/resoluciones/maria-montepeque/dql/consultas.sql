USE campuslands_mysql;

-- 1. Estado actual de la caja
SELECT turno, monto_inicial, monto_actual, (monto_actual - monto_inicial) AS total_recaudado
FROM caja_avanzado;

-- 2. Pagos que quedaron confirmados tras las transacciones
SELECT mesa, concepto, monto, estado, creado_en
FROM pagos_mesas_avanzado
ORDER BY id_pago;

-- 3. Total recibido por mesa
SELECT mesa, SUM(monto) AS total_recibido
FROM pagos_mesas_avanzado
WHERE estado = 'confirmado'
GROUP BY mesa
ORDER BY total_recibido DESC;

-- 4. Confirmar que la propina de la Mesa 8 NO quedo registrada (se revirtio con SAVEPOINT)
SELECT COUNT(*) AS propinas_registradas
FROM pagos_mesas_avanzado
WHERE mesa = 'Mesa 8' AND concepto = 'propina';

-- 5. Confirmar que el pago de la Mesa 3 no quedo registrado (ROLLBACK total)
SELECT COUNT(*) AS pagos_mesa_3
FROM pagos_mesas_avanzado
WHERE mesa = 'Mesa 3';

-- 6. Verificar consistencia: monto_actual debe coincidir con
-- monto_inicial mas la suma de los pagos realmente confirmados
SELECT
  c.monto_actual AS actual_en_tabla,
  (c.monto_inicial + COALESCE(SUM(pg.monto), 0)) AS actual_calculado
FROM caja_avanzado c
LEFT JOIN pagos_mesas_avanzado pg ON pg.id_caja = c.id_caja AND pg.estado = 'confirmado'
GROUP BY c.id_caja, c.monto_actual, c.monto_inicial;
