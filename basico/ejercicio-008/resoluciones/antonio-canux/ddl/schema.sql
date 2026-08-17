-- Campuslands MySQL - basico ejercicio 008
-- Contexto: Modulo de datos para futbol sala.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_008;

CREATE TABLE basico_ejercicio_008 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  posicion ENUM('portero','cierre','ala','pivot') NOT NULL,
  goles INT NOT NULL DEFAULT 0,
  tarjetas_amarillas INT NOT NULL DEFAULT 0,
  salario DECIMAL(10,2) NOT NULL,
  estado ENUM('activo','lesionado','suspendido') NOT NULL DEFAULT 'activo',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);