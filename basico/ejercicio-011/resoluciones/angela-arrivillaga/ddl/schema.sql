CREATE DATABASE IF NOT EXISTS pingpong_db;
USE pingpong_db;

CREATE TABLE jugadores (
    id_jugador INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(60) NOT NULL,
    nivel ENUM('principiante', 'intermedio', 'avanzado') DEFAULT 'principiante',
    puntos_ranking INT DEFAULT 1000,
    activo BOOLEAN DEFAULT TRUE,
    CONSTRAINT chk_ranking CHECK (puntos_ranking >= 0)
);

CREATE TABLE partidos (
    id_partido INT PRIMARY KEY AUTO_INCREMENT,
    id_jugador1 INT,
    id_jugador2 INT,
    sets_jugador1 INT DEFAULT 0,
    sets_jugador2 INT DEFAULT 0,
    fecha_partido DATE,
    FOREIGN KEY (id_jugador1) REFERENCES jugadores(id_jugador1),
    FOREIGN KEY (id_jugador2) REFERENCES jugadores(id_jugador2),
    CONSTRAINT chk_sets CHECK (sets_jugador1 >= 0 AND sets_jugador2 >= 0)
);