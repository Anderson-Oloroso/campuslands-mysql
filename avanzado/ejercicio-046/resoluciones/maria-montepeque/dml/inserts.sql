-- Datos de practica: caja y pagos de mesas de un restaurante de comida urbana.
USE campuslands_mysql;

INSERT INTO caja_avanzado (turno, monto_inicial, monto_actual) VALUES
('Turno Noche - 2026-03-01', 500000.00, 500000.00);

-- ===================================================================
-- Transaccion 1: pago exitoso de la Mesa 5 (paga su cuenta completa) -> COMMIT.
-- ===================================================================
START TRANSACTION;

UPDATE caja_avanzado
SET monto_actual = monto_actual + 85000.00
WHERE turno = 'Turno Noche - 2026-03-01';

INSERT INTO pagos_mesas_avanzado (id_caja, mesa, concepto, monto, estado)
SELECT id_caja, 'Mesa 5', 'cuenta', 85000.00, 'confirmado'
FROM caja_avanzado WHERE turno = 'Turno Noche - 2026-03-01';

COMMIT;

-- ===================================================================
-- Transaccion 2: pago con SAVEPOINT.
-- Se confirma la cuenta de la Mesa 8, pero antes de aplicar una
-- propina adicional se crea un SAVEPOINT; el cliente reclama que no
-- queria dejarla, asi que se revierte solo ese tramo con ROLLBACK TO,
-- conservando el pago principal ya aplicado.
-- ===================================================================
START TRANSACTION;

UPDATE caja_avanzado
SET monto_actual = monto_actual + 62000.00
WHERE turno = 'Turno Noche - 2026-03-01';

INSERT INTO pagos_mesas_avanzado (id_caja, mesa, concepto, monto, estado)
SELECT id_caja, 'Mesa 8', 'cuenta', 62000.00, 'confirmado'
FROM caja_avanzado WHERE turno = 'Turno Noche - 2026-03-01';

SAVEPOINT antes_de_propina;

UPDATE caja_avanzado
SET monto_actual = monto_actual + 6000.00
WHERE turno = 'Turno Noche - 2026-03-01';

INSERT INTO pagos_mesas_avanzado (id_caja, mesa, concepto, monto, estado)
SELECT id_caja, 'Mesa 8', 'propina', 6000.00, 'confirmado'
FROM caja_avanzado WHERE turno = 'Turno Noche - 2026-03-01';

-- El cliente reclama que no queria dejar propina: se revierte solo este tramo.
ROLLBACK TO SAVEPOINT antes_de_propina;

COMMIT;

-- ===================================================================
-- Transaccion 3: pago cancelado antes de confirmar -> ROLLBACK total.
-- La Mesa 3 se retira sin pagar (walk-out); el cobro se revierte por completo.
-- ===================================================================
START TRANSACTION;

UPDATE caja_avanzado
SET monto_actual = monto_actual + 45000.00
WHERE turno = 'Turno Noche - 2026-03-01';

INSERT INTO pagos_mesas_avanzado (id_caja, mesa, concepto, monto, estado)
SELECT id_caja, 'Mesa 3', 'cuenta', 45000.00, 'confirmado'
FROM caja_avanzado WHERE turno = 'Turno Noche - 2026-03-01';

ROLLBACK;
