DROP DATABASE IF EXISTS liga_futbol_db;
CREATE DATABASE liga_futbol_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE liga_futbol_db;

CREATE TABLE equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    ciudad VARCHAR(50) NOT NULL,
    estadio VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    posicion ENUM('Portero', 'Defensa', 'Mediocampista', 'Delantero') NOT NULL,
    goles INT UNSIGNED DEFAULT 0,
    estado ENUM('activo', 'lesionado', 'suspendido') DEFAULT 'activo',
    equipo_id INT NOT NULL,
    CONSTRAINT fk_equipo FOREIGN KEY (equipo_id) REFERENCES equipos(id) ON DELETE CASCADE
) ENGINE=InnoDB;