-- DDL: Estructura en Tercera Forma Normal (3FN) para Fútbol Sala
-- Se eliminan dependencias transitivas separando sedes, entrenadores y equipos
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS partidos_futsal_3fn;
DROP TABLE IF EXISTS equipos_futsal_3fn;
DROP TABLE IF EXISTS entrenadores_futsal_3fn;
DROP TABLE IF EXISTS sedes_futsal_3fn;

CREATE TABLE sedes_futsal_3fn (
    sede_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_sede VARCHAR(80) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    capacidad INT NOT NULL CHECK (capacidad > 0)
) ENGINE=InnoDB;

CREATE TABLE entrenadores_futsal_3fn (
    entrenador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_entrenador VARCHAR(80) NOT NULL,
    licencia VARCHAR(30) UNIQUE NOT NULL
) ENGINE=InnoDB;

CREATE TABLE equipos_futsal_3fn (
    equipo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(50) NOT NULL UNIQUE,
    entrenador_id INT NOT NULL,
    sede_id INT NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    FOREIGN KEY (entrenador_id) REFERENCES entrenadores_futsal_3fn(entrenador_id),
    FOREIGN KEY (sede_id) REFERENCES sedes_futsal_3fn(sede_id)
) ENGINE=InnoDB;

CREATE TABLE partidos_futsal_3fn (
    partido_id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_local_id INT NOT NULL,
    equipo_visitante_id INT NOT NULL,
    goles_local INT NOT NULL DEFAULT 0,
    goles_visitante INT NOT NULL DEFAULT 0,
    fecha_partido DATETIME NOT NULL,
    FOREIGN KEY (equipo_local_id) REFERENCES equipos_futsal_3fn(equipo_id),
    FOREIGN KEY (equipo_visitante_id) REFERENCES equipos_futsal_3fn(equipo_id)
) ENGINE=InnoDB;
