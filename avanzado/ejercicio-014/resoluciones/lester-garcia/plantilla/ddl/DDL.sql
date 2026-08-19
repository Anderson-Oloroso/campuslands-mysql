CREATE DATABASE ejercicio_14_adv;
USE  ejercicio_14_adv;

CREATE TABLE characters (
    character_id INT PRIMARY KEY AUTO_INCREMENT,
    character_name VARCHAR(100) NOT NULL,
    species VARCHAR(50) NOT NULL,
    faction VARCHAR(50) NOT NULL
);

CREATE TABLE missions (
    mission_id INT PRIMARY KEY AUTO_INCREMENT,
    mission_name VARCHAR(100) NOT NULL,
    mission_date DATE NOT NULL,
    status VARCHAR(30) NOT NULL
);

CREATE TABLE mission_participants (
    mission_id INT NOT NULL,
    character_id INT NOT NULL,
    role_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (mission_id, character_id),
    FOREIGN KEY (mission_id) REFERENCES missions(mission_id),
    FOREIGN KEY (character_id) REFERENCES characters(character_id)
);

CREATE TABLE mission_logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    mission_id INT NOT NULL,
    log_message VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (mission_id) REFERENCES missions(mission_id)
);