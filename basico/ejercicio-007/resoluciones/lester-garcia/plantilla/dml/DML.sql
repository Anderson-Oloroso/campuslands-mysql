USE football_league;

INSERT INTO teams (team_name, city) VALUES
('Tigers FC', 'Bogota'),
('Eagles United', 'Medellin'),
('Lions Club', 'Cali'),
('Sharks FC', 'Barranquilla'),
('Wolves FC', 'Bucaramanga');

INSERT INTO players (player_name, position, age, team_id) VALUES
('Juan Perez', 'Forward', 24, 1),
('Carlos Gomez', 'Midfielder', 27, 2),
('Andres Ruiz', 'Defender', 22, 3),
('Miguel Torres', 'Goalkeeper', 30, 4),
('David Lopez', 'Forward', 26, 5),
('Kevin Diaz', 'Midfielder', 21, 1);

INSERT INTO matches (home_team_id, away_team_id, match_date, stadium) VALUES
(1, 2, '2026-03-05', 'National Stadium'),
(3, 4, '2026-03-08', 'Central Arena'),
(5, 1, '2026-03-12', 'Metropolitan Stadium'),
(2, 3, '2026-03-18', 'City Stadium'),
(4, 5, '2026-03-22', 'North Arena'),
(1, 3, '2026-03-28', 'National Stadium');

INSERT INTO standings (team_id, matches_played, points, goals_scored) VALUES
(1, 10, 24, 22),
(2, 10, 19, 17),
(3, 10, 21, 20),
(4, 10, 15, 14),
(5, 10, 27, 25);