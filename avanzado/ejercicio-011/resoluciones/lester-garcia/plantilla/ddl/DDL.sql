CREATE DATABASE ejercicio_11_adv;
USE ejercicio_11_adv;

CREATE TABLE players (
    player_id INT PRIMARY KEY AUTO_INCREMENT,
    player_name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    age INT NOT NULL
);

CREATE TABLE tournaments (
    tournament_id INT PRIMARY KEY AUTO_INCREMENT,
    tournament_name VARCHAR(100) NOT NULL,
    location VARCHAR(50) NOT NULL,
    tournament_date DATE NOT NULL
);

CREATE TABLE matches (
    match_id INT PRIMARY KEY AUTO_INCREMENT,
    tournament_id INT NOT NULL,
    player_one_id INT NOT NULL,
    player_two_id INT NOT NULL,
    player_one_score INT NOT NULL,
    player_two_score INT NOT NULL,
    FOREIGN KEY (tournament_id) REFERENCES tournaments(tournament_id),
    FOREIGN KEY (player_one_id) REFERENCES players(player_id),
    FOREIGN KEY (player_two_id) REFERENCES players(player_id)
);