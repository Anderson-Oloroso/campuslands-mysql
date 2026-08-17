USE ejercicio_08;

UPDATE teams
SET city = "Tunja"
WHERE team_name = "Falcons FS";

SELECT * FROM teams;

UPDATE players
SET jersey_number = 15
WHERE player_name = "Kevin Diaz";

SELECT * FROM players;

UPDATE matches
SET venue = "Coliseo Metropolitano"
WHERE match_id = 2;

SELECT * FROM matches;

UPDATE standings
SET matches_played = matches_played + 1
WHERE team_id = 5;

SELECT * FROM standings;

UPDATE players
SET position = "Defender"
WHERE player_name = "Juan Perez";

SELECT * FROM players;