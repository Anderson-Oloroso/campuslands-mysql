CREATE DATABASE ejercicio_07;
USE ejercicio_07;
DROP DATABASE ejercicio_07;

CREATE DATABASE football_league;
USE football_league;

CREATE TABLE teams (
    team_id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL
);

CREATE TABLE players (
    player_id INT PRIMARY KEY AUTO_INCREMENT,
    player_name VARCHAR(100) NOT NULL,
    position VARCHAR(30) NOT NULL,
    age INT NOT NULL,
    team_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

CREATE TABLE matches (
    match_id INT PRIMARY KEY AUTO_INCREMENT,
    home_team_id INT NOT NULL,
    away_team_id INT NOT NULL,
    match_date DATE NOT NULL,
    stadium VARCHAR(60) NOT NULL,
    FOREIGN KEY (home_team_id) REFERENCES teams(team_id),
    FOREIGN KEY (away_team_id) REFERENCES teams(team_id)
);

CREATE TABLE standings (
    standing_id INT PRIMARY KEY AUTO_INCREMENT,
    team_id INT NOT NULL,
    matches_played INT NOT NULL,
    points INT NOT NULL,
    goals_scored INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);