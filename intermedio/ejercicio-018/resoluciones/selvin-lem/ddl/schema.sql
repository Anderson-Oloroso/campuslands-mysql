-- Campuslands MySQL - intermedio ejercicio 018
-- Tematica: viajes y turismo
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS reservas_viajes;

CREATE TABLE reservas_viajes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  destino VARCHAR(80) NOT NULL,
  viajero VARCHAR(100) NOT NULL,
  dias INT NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  fecha_reserva DATE NOT NULL
);
