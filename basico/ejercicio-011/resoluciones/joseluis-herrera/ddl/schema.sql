CREATE DATABASE IF NOT EXISTS pingpong_db;
USE pingpong_db;

DROP TABLE IF EXISTS partidos;
DROP TABLE IF EXISTS jugadores;

CREATE TABLE jugadores (
jugador_id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
edad INT CHECK (edad >= 10 AND edad <= 80),
categoria VARCHAR(50) NOT NULL,
puntos_ranking INT DEFAULT 0 CHECK (puntos_ranking >= 0)
);

CREATE TABLE partidos (
partido_id INT AUTO_INCREMENT PRIMARY KEY,
jugador_1_id INT NOT NULL,
jugador_2_id INT NOT NULL,
puntos_j1 INT CHECK (puntos_j1 >= 0),
puntos_j2 INT CHECK (puntos_j2 >= 0),
fecha_partido DATE NOT NULL,
FOREIGN KEY (jugador_1_id) REFERENCES jugadores(jugador_id),
FOREIGN KEY (jugador_2_id) REFERENCES jugadores(jugador_id)
);
