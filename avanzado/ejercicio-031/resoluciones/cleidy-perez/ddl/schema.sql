-- Campuslands MySQL - basico ejercicio 001
-- Ejecuta este archivo antes de inserts.sql.
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_esports;

CREATE TABLE jugadores_esports (
  id_jugadores INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  categoria VARCHAR(80) NOT NULL,
  puntaje DECIMAL(10,2) NOT NULL DEFAULT 0,
  estado ENUM('activo','revision','inactivo') NOT NULL DEFAULT 'activo',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE jugadores_esports 
ADD COLUMN id_equipo INT,
ADD CONSTRAINT fk_jugadores_equipos 
    FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo);
    
CREATE TABLE equipos (
  id_equipo INT AUTO_INCREMENT PRIMARY KEY,
  nombre_equipo VARCHAR(100) NOT NULL,
  region VARCHAR(50)
);
