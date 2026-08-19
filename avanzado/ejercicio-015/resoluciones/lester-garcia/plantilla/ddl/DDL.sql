CREATE DATABASE ejercicio_15_adv;
USE ejercicio_15_adv;

CREATE TABLE games (
    game_id INT PRIMARY KEY AUTO_INCREMENT,
    game_title VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    release_year YEAR NOT NULL,
    platform VARCHAR(50) NOT NULL
);

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    game_id INT NOT NULL,
    user_id INT NOT NULL,
    loan_date DATE NOT NULL,
    return_date DATE NULL,
    FOREIGN KEY (game_id) REFERENCES games(game_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE INDEX idx_games_genre
ON games(genre);

CREATE INDEX idx_games_platform
ON games(platform);

CREATE INDEX idx_loans_game
ON loans(game_id);

CREATE INDEX idx_loans_user
ON loans(user_id);

CREATE INDEX idx_loans_date
ON loans(loan_date);