-- DDL: Estructura para gestión de Torneos y Partidos de Ping-Pong
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS partidos_pingpong;
DROP TABLE IF EXISTS jugadores_pingpong;

CREATE TABLE jugadores_pingpong (
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_jugador VARCHAR(80) NOT NULL,
    club VARCHAR(60) NOT NULL,
    categoria ENUM('Sub-18', 'Mayores', 'Veteranos') NOT NULL,
    puntos_ranking INT DEFAULT 1000 CHECK (puntos_ranking >= 0),
    estado ENUM('activo', 'lesionado', 'inactivo') DEFAULT 'activo'
) ENGINE=InnoDB;

CREATE TABLE partidos_pingpong (
    partido_id INT AUTO_INCREMENT PRIMARY KEY,
    jugador1_id INT NOT NULL,
    jugador2_id INT NOT NULL,
    sets_jugador1 INT NOT NULL CHECK (sets_jugador1 BETWEEN 0 AND 3),
    sets_jugador2 INT NOT NULL CHECK (sets_jugador2 BETWEEN 0 AND 3),
    fase VARCHAR(40) NOT NULL,
    fecha_partido DATE NOT NULL,
    FOREIGN KEY (jugador1_id) REFERENCES jugadores_pingpong(jugador_id),
    FOREIGN KEY (jugador2_id) REFERENCES jugadores_pingpong(jugador_id)
) ENGINE=InnoDB;
