CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS equipos_liga (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(60) NOT NULL,
    partidos_jugados INT NOT NULL DEFAULT 0,
    puntos INT NOT NULL DEFAULT 0,
    goles_a_favor INT NOT NULL DEFAULT 0,
    goles_en_contra INT NOT NULL DEFAULT 0,
    estado ENUM('activo', 'sancionado', 'descansando') DEFAULT 'activo',
    CONSTRAINT chk_partidos CHECK (partidos_jugados >= 0),
    CONSTRAINT chk_puntos CHECK (puntos >= 0)
);