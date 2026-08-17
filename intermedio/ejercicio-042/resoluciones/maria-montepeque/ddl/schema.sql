-- Campuslands MySQL - intermedio ejercicio 042
-- Resolucion: maria-montepeque
-- Tema: playlist musical
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS reproducciones_intermedio;

CREATE TABLE reproducciones_intermedio (
  id_reproduccion INT AUTO_INCREMENT PRIMARY KEY,
  usuario VARCHAR(80) NOT NULL,
  genero ENUM('pop','rock','reggaeton','electronica') NOT NULL,
  duracion_seg INT NOT NULL,
  completada BOOLEAN NOT NULL DEFAULT TRUE,
  fecha_reproduccion DATE NOT NULL,
  CONSTRAINT chk_reproducciones_intermedio_duracion CHECK (duracion_seg > 0)
);
