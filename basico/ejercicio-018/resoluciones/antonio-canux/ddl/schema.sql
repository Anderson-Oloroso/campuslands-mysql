-- Campuslands MySQL - basico ejercicio 018
-- Contexto: Modulo de datos para viajes y turismo (PRIMARY KEY).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_018_reservas;

CREATE TABLE basico_ejercicio_018_reservas (
  codigo_reserva VARCHAR(6) NOT NULL,
  nombre_pasajero VARCHAR(100) NOT NULL,
  numero_pasaporte VARCHAR(20) NOT NULL UNIQUE,
  destino VARCHAR(100) NOT NULL,
  fecha_vuelo DATE NOT NULL,
  clase ENUM('Turista', 'Ejecutiva', 'Primera') NOT NULL DEFAULT 'Turista',
  -- Optimizacion de diseno: Definir explicitamente la llave primaria (Natural Key)
  PRIMARY KEY (codigo_reserva)
);