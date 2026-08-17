-- DML: Registro de jugadores y resultados de partidos
USE campuslands_mysql;

INSERT INTO jugadores_pingpong (nombre_jugador, club, categoria, puntos_ranking, estado) VALUES
('Carlos Morales', 'Spin Master Club', 'Mayores', 1450, 'activo'),
('Lucía Fernández', 'TopSpin Academy', 'Mayores', 1380, 'activo'),
('Diego Ramírez', 'Spin Master Club', 'Sub-18', 1200, 'activo'),
('Andrea Salazar', 'Smash GT', 'Sub-18', 1250, 'activo'),
('Roberto Gómez', 'Smash GT', 'Veteranos', 1100, 'activo'),
('Mario Estrada', 'TopSpin Academy', 'Veteranos', 1050, 'lesionado'),
('Sofia Paiz', 'Spin Master Club', 'Mayores', 1310, 'activo'),
('Gabriel Arriola', 'Smash GT', 'Sub-18', 1180, 'activo');

INSERT INTO partidos_pingpong (jugador1_id, jugador2_id, sets_jugador1, sets_jugador2, fase, fecha_partido) VALUES
(1, 2, 3, 1, 'Final', '2026-07-01'),
(3, 4, 2, 3, 'Semifinal', '2026-07-02'),
(5, 6, 3, 0, 'Semifinal', '2026-07-03'),
(7, 1, 1, 3, 'Cuartos', '2026-07-04'),
(8, 3, 3, 2, 'Cuartos', '2026-07-05'),
(2, 7, 3, 2, 'Semifinal', '2026-07-06'),
(4, 8, 3, 1, 'Final', '2026-07-07'),
(5, 1, 0, 3, 'Exhibición', '2026-07-08');
