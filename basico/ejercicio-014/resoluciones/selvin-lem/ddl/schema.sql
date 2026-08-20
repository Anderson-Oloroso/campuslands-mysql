-- Ejercicio 014 - fechas basicas para saga de ciencia ficcion
-- Ejecutar primero. Orden: schema.sql -> inserts.sql -> consultas.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_014;

CREATE TABLE basico_ejercicio_014 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  numero_entrega INT NOT NULL,
  fecha_estreno DATE NOT NULL,
  duracion_minutos INT NOT NULL,
  estado ENUM('estrenada','proxima','cancelada') NOT NULL DEFAULT 'proxima',
  agregada_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT chk_numero_entrega_valido CHECK (numero_entrega > 0)
);
