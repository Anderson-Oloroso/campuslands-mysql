-- Campuslands MySQL - avanzado ejercicio 008
-- Contexto: Modulo de datos para futbol sala (Roles y Permisos).
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS avanzado_ejercicio_008_contratos;
DROP TABLE IF EXISTS avanzado_ejercicio_008_jugadores;

CREATE TABLE avanzado_ejercicio_008_jugadores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  posicion ENUM('portero', 'cierre', 'ala', 'pivot') NOT NULL,
  dorsal INT NOT NULL
);

CREATE TABLE avanzado_ejercicio_008_contratos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  jugador_id INT NOT NULL,
  salario_mensual DECIMAL(10,2) NOT NULL,
  fecha_vencimiento DATE NOT NULL,
  FOREIGN KEY (jugador_id) REFERENCES avanzado_ejercicio_008_jugadores(id)
);