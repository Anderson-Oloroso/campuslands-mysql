DROP DATABASE IF EXISTS db_pingpong;
CREATE DATABASE db_pingpong;
USE db_pingpong;

CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    nivel VARCHAR(20) NOT NULL,
    partidos_ganados INT UNSIGNED DEFAULT 0,
    partidos_perdidos INT UNSIGNED DEFAULT 0,
    estado VARCHAR(20) DEFAULT 'Activo',
    CONSTRAINT chk_nivel CHECK (nivel IN ('Principiante', 'Intermedio', 'Avanzado', 'Profesional'))
);