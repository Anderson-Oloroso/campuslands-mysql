-- Campuslands MySQL - basico ejercicio 040
-- Resolucion: maria-montepeque
-- Tema: carreras urbanas
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS corredores_basico;

CREATE TABLE corredores_basico (
  id_corredor INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  categoria ENUM('5k','10k','21k','42k') NOT NULL,
  tiempo_minutos DECIMAL(6,2) NOT NULL,
  costo_inscripcion DECIMAL(10,2) NOT NULL,
  resultado ENUM('finalizado','abandono','descalificado') NOT NULL DEFAULT 'finalizado',
  fecha_carrera DATE NOT NULL,
  CONSTRAINT chk_corredores_basico_tiempo CHECK (tiempo_minutos > 0),
  CONSTRAINT chk_corredores_basico_costo CHECK (costo_inscripcion > 0)
);
