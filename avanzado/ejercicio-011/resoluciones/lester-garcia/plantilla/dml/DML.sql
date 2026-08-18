USE ejercicio_11_adv;

INSERT INTO players (player_name, country, age) VALUES
('Carlos Mendoza', 'Colombia', 24),
('Daniel Torres', 'Mexico', 27),
('Miguel Ramirez', 'Spain', 22),
('Andres Castillo', 'Argentina', 29),
('Luis Herrera', 'Chile', 25),
('Sebastian Gomez', 'Colombia', 23);

INSERT INTO tournaments (tournament_name, location, tournament_date) VALUES
('Open Masters', 'Bogota', '2026-03-10'),
('Elite Table Cup', 'Medellin', '2026-04-15'),
('International Open', 'Cali', '2026-05-20'),
('Champions Table', 'Barranquilla', '2026-06-18'),
('Summer Ping Pong', 'Cartagena', '2026-07-25');

INSERT INTO matches (tournament_id, player_one_id, player_two_id, player_one_score, player_two_score) VALUES
(1, 1, 2, 11, 7),
(1, 3, 4, 8, 11),
(2, 1, 3, 11, 9),
(2, 2, 5, 11, 6),
(3, 4, 6, 7, 11),
(3, 1, 5, 11, 5);