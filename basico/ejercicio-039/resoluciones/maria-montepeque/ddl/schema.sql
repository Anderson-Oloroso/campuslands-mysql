-- Campuslands MySQL - basico ejercicio 039
-- Resolucion: maria-montepeque
-- Tema: kickboxing
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS inscripciones_kickboxing_basico;

CREATE TABLE inscripciones_kickboxing_basico (
  id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
  alumno VARCHAR(120) NOT NULL,
  categoria ENUM('infantil','juvenil','adulto','master') NOT NULL,
  modalidad ENUM('semicontacto','contacto_pleno','light_contact','k1') NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  estado ENUM('activa','pausada','cancelada','vencida') NOT NULL DEFAULT 'activa',
  fecha_inscripcion DATE NOT NULL,
  CONSTRAINT chk_inscripciones_kickboxing_basico_costo CHECK (costo > 0)
);
