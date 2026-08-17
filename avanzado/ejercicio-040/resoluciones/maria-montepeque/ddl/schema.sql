-- Campuslands MySQL - avanzado ejercicio 040
-- Resolucion: maria-montepeque
-- Tema: carreras urbanas
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS resultados_avanzado;

CREATE TABLE resultados_avanzado (
  id_resultado INT AUTO_INCREMENT PRIMARY KEY,
  corredor VARCHAR(120) NOT NULL,
  carrera VARCHAR(120) NOT NULL,
  categoria ENUM('5k','10k','21k','42k') NOT NULL,
  tiempo_minutos DECIMAL(6,2) NOT NULL,
  posicion INT NOT NULL,
  CONSTRAINT chk_resultados_avanzado_tiempo CHECK (tiempo_minutos > 0),
  CONSTRAINT chk_resultados_avanzado_posicion CHECK (posicion > 0)
);
