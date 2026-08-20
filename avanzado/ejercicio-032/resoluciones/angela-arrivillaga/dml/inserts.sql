USE campuslands_mysql;

INSERT INTO jugadores_br (gamertag, rango, puntos_liga, victorias_totales, estado) VALUES
('shadow_sniper', 'Gran Maestro', 4500, 85, 'leyenda'),
('vortex_queen', 'Maestro', 3800, 60, 'activo'),
('apex_predator', 'Gran Maestro', 4900, 95, 'leyenda'),
('ghost_rider', 'Diamante', 2900, 35, 'activo'),
('neon_blade', 'Diamante', 2750, 30, 'activo'),
('toxic_aim', 'Platino', 1950, 15, 'activo'),
('storm_bringer', 'Oro', 1200, 8, 'activo'),
('pixel_king', 'Platino', 2100, 18, 'activo');

-- Uso de prueba del procedimiento almacenado avanzado para registrar una nueva partida
CALL sp_registrar_partida_br(2, 7, 1, 150);
CALL sp_registrar_partida_br(4, 12, 3, 90);