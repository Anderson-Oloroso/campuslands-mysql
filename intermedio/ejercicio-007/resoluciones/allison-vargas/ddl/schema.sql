-- DDL: Normalización 2FN para Liga de Fútbol (Eliminación de dependencias parciales)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS rendimiento_equipos_estadio;
DROP TABLE IF EXISTS equipos_liga_intermedio;
DROP TABLE IF EXISTS estadios_liga;

-- Entidad 1: Estadios (Atributos dependientes de estadio_id)
CREATE TABLE estadios_liga (
    estadio_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estadio VARCHAR(80) NOT NULL UNIQUE,
    ciudad VARCHAR(50) NOT NULL,
    capacidad INT NOT NULL CHECK (capacidad > 0)
) ENGINE=InnoDB;

-- Entidad 2: Equipos (Atributos dependientes de equipo_id)
CREATE TABLE equipos_liga_intermedio (
    equipo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(50) NOT NULL UNIQUE,
    director_tecnico VARCHAR(80) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB;

-- Entidad 3 (2FN): Rendimiento por Equipo y Estadio (Clave primaria compuesta sin dependencias parciales)
CREATE TABLE rendimiento_equipos_estadio (
    equipo_id INT NOT NULL,
    estadio_id INT NOT NULL,
    partidos_jugados INT NOT NULL DEFAULT 0 CHECK (partidos_jugados >= 0),
    partidos_ganados INT NOT NULL DEFAULT 0 CHECK (partidos_ganados >= 0),
    goles_anotados INT NOT NULL DEFAULT 0 CHECK (goles_anotados >= 0),
    PRIMARY KEY (equipo_id, estadio_id),
    FOREIGN KEY (equipo_id) REFERENCES equipos_liga_intermedio(equipo_id) ON DELETE CASCADE,
    FOREIGN KEY (estadio_id) REFERENCES estadios_liga(estadio_id) ON DELETE CASCADE
) ENGINE=InnoDB;
