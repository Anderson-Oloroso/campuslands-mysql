-- Datos de practica: fondo de premios y pagos de un torneo esports MOBA.
USE campuslands_mysql;

INSERT INTO premio_pool_avanzado (torneo, monto_total, monto_disponible) VALUES
('Copa MOBA Latinoamerica 2026', 100000.00, 100000.00);

-- ===================================================================
-- Transaccion 1: pago exitoso al campeon de la final -> COMMIT.
-- ===================================================================
START TRANSACTION;

UPDATE premio_pool_avanzado
SET monto_disponible = monto_disponible - 40000.00
WHERE torneo = 'Copa MOBA Latinoamerica 2026';

INSERT INTO pagos_equipos_avanzado (id_pool, equipo, monto, fase, estado)
SELECT id_pool, 'Furia Andina', 40000.00, 'final', 'confirmado'
FROM premio_pool_avanzado WHERE torneo = 'Copa MOBA Latinoamerica 2026';

COMMIT;

-- ===================================================================
-- Transaccion 2: pago con SAVEPOINT.
-- Se confirma el pago de semifinal a Nightfall Esports, pero antes de
-- aplicar un bono adicional se crea un SAVEPOINT; el organizador
-- decide no otorgar el bono, asi que se revierte solo ese tramo con
-- ROLLBACK TO, conservando el pago principal ya aplicado.
-- ===================================================================
START TRANSACTION;

UPDATE premio_pool_avanzado
SET monto_disponible = monto_disponible - 25000.00
WHERE torneo = 'Copa MOBA Latinoamerica 2026';

INSERT INTO pagos_equipos_avanzado (id_pool, equipo, monto, fase, estado)
SELECT id_pool, 'Nightfall Esports', 25000.00, 'semifinal', 'confirmado'
FROM premio_pool_avanzado WHERE torneo = 'Copa MOBA Latinoamerica 2026';

SAVEPOINT antes_del_bono;

UPDATE premio_pool_avanzado
SET monto_disponible = monto_disponible - 5000.00
WHERE torneo = 'Copa MOBA Latinoamerica 2026';

INSERT INTO pagos_equipos_avanzado (id_pool, equipo, monto, fase, estado)
SELECT id_pool, 'Nightfall Esports (bono)', 5000.00, 'semifinal', 'confirmado'
FROM premio_pool_avanzado WHERE torneo = 'Copa MOBA Latinoamerica 2026';

-- El organizador decide no otorgar el bono: se revierte solo este tramo.
ROLLBACK TO SAVEPOINT antes_del_bono;

COMMIT;

-- ===================================================================
-- Transaccion 3: pago cancelado antes de confirmar -> ROLLBACK total.
-- Dragones del Norte queda descalificado por una falta reglamentaria
-- despues de jugar cuartos; el pago se revierte por completo.
-- ===================================================================
START TRANSACTION;

UPDATE premio_pool_avanzado
SET monto_disponible = monto_disponible - 10000.00
WHERE torneo = 'Copa MOBA Latinoamerica 2026';

INSERT INTO pagos_equipos_avanzado (id_pool, equipo, monto, fase, estado)
SELECT id_pool, 'Dragones del Norte', 10000.00, 'cuartos', 'confirmado'
FROM premio_pool_avanzado WHERE torneo = 'Copa MOBA Latinoamerica 2026';

ROLLBACK;
