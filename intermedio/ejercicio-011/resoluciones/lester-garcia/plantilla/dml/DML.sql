USE ejercicio_11_int;

INSERT INTO jugadores (nombre, nickname, edad, ranking) VALUES
('Carlos Méndez', 'SpinMaster', 22, 145),
('Luis Herrera', 'TopSpin', 25, 98),
('Andrés Castillo', 'FastPaddle', 21, 210),
('Mateo Ramírez', 'SmashKing', 27, 67),
('Daniel Torres', 'NetMaster', 23, 175),
('Jorge Morales', 'BackhandPro', 29, 132);

INSERT INTO torneos (nombre, categoria, premio, fecha) VALUES
('Guatemala Open', 'Profesional', 15000.00, '2026-02-15'),
('Central America Cup', 'Profesional', 22000.00, '2026-03-20'),
('Spring Table Championship', 'Amateur', 8000.00, '2026-04-18'),
('Masters Pingpong League', 'Profesional', 30000.00, '2026-05-25'),
('Summer Paddle Cup', 'Amateur', 10000.00, '2026-06-15'),
('International Table Masters', 'Profesional', 45000.00, '2026-07-30');

INSERT INTO partidos (
    id_torneo,
    jugador_a,
    jugador_b,
    puntos_jugador_a,
    puntos_jugador_b,
    estado
) VALUES
(1, 1, 2, 11, 8, 'Finalizado'),
(1, 3, 4, 7, 11, 'Finalizado'),
(2, 2, 5, 11, 9, 'Finalizado'),
(2, 1, 6, 10, 12, 'Finalizado'),
(3, 4, 5, 11, 6, 'Finalizado'),
(4, 1, 3, 11, 9, 'Finalizado'),
(4, 2, 6, 8, 11, 'Finalizado'),
(5, 3, 5, 0, 0, 'Programado'),
(6, 1, 4, 0, 0, 'Programado');