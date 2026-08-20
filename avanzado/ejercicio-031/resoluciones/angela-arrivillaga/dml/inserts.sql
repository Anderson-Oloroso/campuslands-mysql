USE campuslands_mysql;

INSERT INTO equipos_moba (nombre, region, puntos_ranking, premio_acumulado, estado) VALUES
('team liquid', 'NA', 1850, 150000.00, 'activo'),
('t1', 'KR', 2400, 300000.00, 'campeon'),
('g2 esports', 'EMEA', 1920, 180000.00, 'activo'),
('fnatic', 'EMEA', 1650, 95000.00, 'activo'),
('psg talon', 'PCS', 1400, 50000.00, 'eliminado'),
('cloud9', 'NA', 1700, 110000.00, 'activo'),
('bilibili gaming', 'LPL', 2200, 250000.00, 'activo'),
('gen.g', 'KR', 2350, 280000.00, 'activo');

-- Bloque de transaccion avanzada para simulacion de transferencia de jugador con control de errores y atomicidad
START TRANSACTION;

-- Transferir jugador ficticio y actualizar presupuestos/premios acumulados o simular operacion critica
INSERT INTO transferencias_jugadores (jugador, equipo_origen_id, equipo_destino_id, costo_transferencia) 
VALUES ('Faker_Clone', 2, 8, 75000.00);

UPDATE equipos_moba 
SET premio_acumulado = premio_acumulado + 75000.00 
WHERE id = 2;

UPDATE equipos_moba 
SET premio_acumulado = premio_acumulado - 75000.00 
WHERE id = 8 AND premio_acumulado >= 75000.00;

COMMIT;