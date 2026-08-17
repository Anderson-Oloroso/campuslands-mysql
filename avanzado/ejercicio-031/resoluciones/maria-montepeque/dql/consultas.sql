USE campuslands_mysql;

-- 1. Estado actual del fondo de premios
SELECT torneo, monto_total, monto_disponible, (monto_total - monto_disponible) AS monto_pagado
FROM premio_pool_avanzado;

-- 2. Pagos que quedaron confirmados tras las transacciones
SELECT equipo, monto, fase, estado, creado_en
FROM pagos_equipos_avanzado
ORDER BY id_pago;

-- 3. Total pagado por equipo
SELECT equipo, SUM(monto) AS total_recibido
FROM pagos_equipos_avanzado
WHERE estado = 'confirmado'
GROUP BY equipo
ORDER BY total_recibido DESC;

-- 4. Confirmar que el bono de Nightfall Esports NO quedo registrado (se revirtio con SAVEPOINT)
SELECT COUNT(*) AS pagos_de_bono
FROM pagos_equipos_avanzado
WHERE equipo = 'Nightfall Esports (bono)';

-- 5. Confirmar que el pago a Dragones del Norte no quedo registrado (ROLLBACK total)
SELECT COUNT(*) AS pagos_dragones_del_norte
FROM pagos_equipos_avanzado
WHERE equipo = 'Dragones del Norte';

-- 6. Verificar consistencia: monto_disponible debe coincidir con
-- monto_total menos la suma de los pagos realmente confirmados
SELECT
  p.monto_disponible AS disponible_en_tabla,
  (p.monto_total - COALESCE(SUM(pg.monto), 0)) AS disponible_calculado
FROM premio_pool_avanzado p
LEFT JOIN pagos_equipos_avanzado pg ON pg.id_pool = p.id_pool AND pg.estado = 'confirmado'
GROUP BY p.id_pool, p.monto_disponible, p.monto_total;
