-- DDL: Estructura de mesa de torneos de Ping-Pong con validaciones simples de campo
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS torneos_pingpong;

CREATE TABLE torneos_pingpong (
    torneo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_jugador VARCHAR(80) NOT NULL,
    categoria ENUM('Sub-18', 'Mayores', 'Veteranos') NOT NULL,
    partidos_jugados INT NOT NULL DEFAULT 0 CHECK (partidos_jugados >= 0),
    partidos_ganados INT NOT NULL DEFAULT 0 CHECK (partidos_ganados >= 0),
    puntos_ranking INT NOT NULL DEFAULT 1000 CHECK (puntos_ranking >= 0),
    estado ENUM('inscrito', 'eliminado', 'campeon', 'descalificado') DEFAULT 'inscrito',
    CONSTRAINT chk_partidos_ganados CHECK (partidos_ganados <= partidos_jugados)
) ENGINE=InnoDB;
