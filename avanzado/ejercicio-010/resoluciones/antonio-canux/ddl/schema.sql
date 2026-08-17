-- Campuslands MySQL - avanzado ejercicio 010
-- Contexto: Modulo de datos para carreras urbanas (Backup Logico).
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS avanzado_ejercicio_010_autos_backup;
DROP TABLE IF EXISTS avanzado_ejercicio_010_autos;

CREATE TABLE avanzado_ejercicio_010_autos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  piloto VARCHAR(100) NOT NULL,
  coche VARCHAR(100) NOT NULL,
  modificacion_motor VARCHAR(100) NOT NULL,
  valor_estimado DECIMAL(12,2) NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Tabla estructuralmente identica para simular el respaldo logico a nivel SQL
CREATE TABLE avanzado_ejercicio_010_autos_backup (
  id INT PRIMARY KEY,
  piloto VARCHAR(100) NOT NULL,
  coche VARCHAR(100) NOT NULL,
  modificacion_motor VARCHAR(100) NOT NULL,
  valor_estimado DECIMAL(12,2) NOT NULL,
  creado_en DATETIME NOT NULL,
  respaldado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);