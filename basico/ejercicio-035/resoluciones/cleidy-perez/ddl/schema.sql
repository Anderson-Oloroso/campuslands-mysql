-- Campuslands MySQL - basico ejercicio 005
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS taller_motos;

CREATE TABLE taller_motos (
  id_motos INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  propetario VARCHAR(80) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  placa VARCHAR (10) NOT NULL UNIQUE,
  marca VARCHAR (50) NOT NULL,
  estado ENUM('revision','en_proces', 'entregado') NOT NULL DEFAULT 'revision',
  fecha_revision DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
