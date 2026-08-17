-- Campuslands MySQL - basico ejercicio 050
-- Resolucion: maria-montepeque
-- Tema: estudio de tatuajes
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS disenos_basico;

CREATE TABLE disenos_basico (
  id_diseno INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  estilo ENUM('tradicional','realismo','blackwork','acuarela','minimalista') NOT NULL,
  tatuador VARCHAR(60) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  disponible BOOLEAN NOT NULL DEFAULT TRUE,
  CONSTRAINT chk_disenos_basico_precio CHECK (precio > 0)
);
