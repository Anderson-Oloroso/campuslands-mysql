USE ejercicio_07;

SELECT * 
FROM teams
ORDER BY team_name ASC;

SELECT * FROM players
ORDER BY age ASC;

SELECT * FROM players
ORDER BY player_name ASC;

SELECT *
FROM matches
ORDER BY match_date ASC;

SELECT * FROM  standings
ORDER BY points DESC;

SELECT t.team_name, s.goals_scored
FROM standings s
INNER JOIN teams t
ON S.team_id = t.team_id
ORDER BY s.goals_scored DESC;


