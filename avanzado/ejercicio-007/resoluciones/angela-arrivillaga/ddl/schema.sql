CREATE DATABASE IF NOT EXISTS liga_futbol;
USE liga_futbol;

CREATE TABLE equipos (
    id_equipo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    fecha_fundacion DATE
);

CREATE TABLE partidos (
    id_partido INT PRIMARY KEY AUTO_INCREMENT,
    id_equipo_local INT,
    id_equipo_visitante INT,
    goles_local INT DEFAULT 0,
    goles_visitante INT DEFAULT 0,
    fecha_partido DATETIME,
    estado ENUM('programado', 'finalizado', 'cancelado') DEFAULT 'programado',
    FOREIGN KEY (id_equipo_local) REFERENCES equipos(id_equipo),
    FOREIGN KEY (id_equipo_visitante) REFERENCES equipos(id_equipo),
    CONSTRAINT chk_goles CHECK (goles_local >= 0 AND goles_visitante >= 0)
);