-- Campuslands MySQL - basico ejercicio 022
-- Resolucion: maria-montepeque
-- Tema: animacion 3D
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS renders_basico;

CREATE TABLE renders_basico (
  id_render INT AUTO_INCREMENT PRIMARY KEY,
  proyecto VARCHAR(120) NOT NULL,
  motor_render ENUM('Blender Cycles','Arnold','V-Ray','Redshift','Octane') NOT NULL,
  resolucion ENUM('720p','1080p','2K','4K','8K') NOT NULL,
  tiempo_render_min INT NOT NULL,
  calidad_puntaje DECIMAL(3,1) NOT NULL,
  fecha_render DATE NOT NULL,
  CONSTRAINT chk_renders_basico_tiempo CHECK (tiempo_render_min > 0),
  CONSTRAINT chk_renders_basico_calidad CHECK (calidad_puntaje BETWEEN 0 AND 10)
);
