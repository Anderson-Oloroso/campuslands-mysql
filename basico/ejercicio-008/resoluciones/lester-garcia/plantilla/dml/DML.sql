USE ejercicio_08;

INSERT INTO teams (team_name, city) VALUES
('Falcons FS', 'Bogota'),
('Titans FS', 'Medellin'),
('Phoenix FS', 'Cali'),
('Storm FS', 'Barranquilla'),
('Warriors FS', 'Cartagena');

INSERT INTO players (player_name, position, jersey_number, team_id) VALUES
('Juan Perez', 'Pivot', 9, 1),
('Carlos Gomez', 'Goalkeeper', 1, 2),
('Andres Ruiz', 'Winger', 11, 3),
('Miguel Torres', 'Defender', 4, 4),
('David Lopez', 'Pivot', 10, 5),
('Kevin Diaz', 'Winger', 7, 1);

INSERT INTO matches (home_team_id, away_team_id, match_date, venue) VALUES
(1, 2, '2026-04-05', 'Arena Norte'),
(3, 4, '2026-04-08', 'Coliseo Central'),
(5, 1, '2026-04-12', 'Arena Sur'),
(2, 3, '2026-04-18', 'Polideportivo'),
(4, 5, '2026-04-22', 'Arena Este'),
(1, 3, '2026-04-28', 'Arena Norte');

INSERT INTO standings (team_id, matches_played, points, goal_difference) VALUES
(1, 8, 18, 12),
(2, 8, 15, 6),
(3, 8, 20, 15),
(4, 8, 10, -3),
(5, 8, 13, 2);