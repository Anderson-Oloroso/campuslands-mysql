-- Campuslands MySQL - intermedio ejercicio 018
-- Contexto: Modulo de datos para viajes y turismo (GROUP BY).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS intermedio_ejercicio_018_vuelos;

CREATE TABLE intermedio_ejercicio_018_vuelos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  aerolinea VARCHAR(100) NOT NULL,
  destino VARCHAR(100) NOT NULL,
  estado_vuelo ENUM('Completado', 'Cancelado', 'Retrasado') NOT NULL DEFAULT 'Completado',
  pasajeros INT NOT NULL,
  precio_boleto DECIMAL(8,2) NOT NULL,
  fecha_vuelo DATE NOT NULL
);