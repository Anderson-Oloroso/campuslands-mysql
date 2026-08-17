-- Campuslands MySQL - avanzado ejercicio 009
-- Contexto: Modulo de datos para kickboxing (Bloqueos - Locks).
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS avanzado_ejercicio_009_peleadores;

CREATE TABLE avanzado_ejercicio_009_peleadores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  categoria VARCHAR(50) NOT NULL,
  victorias INT NOT NULL DEFAULT 0,
  derrotas INT NOT NULL DEFAULT 0,
  puntos_ranking INT NOT NULL DEFAULT 0,
  estado ENUM('activo', 'inactivo', 'suspendido') NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB;