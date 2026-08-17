-- Campuslands MySQL - basico ejercicio 020
-- Resolucion: maria-montepeque
-- Tema: estudio de tatuajes
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS disenos_basico;

CREATE TABLE disenos_basico (
  id_diseno INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  estilo ENUM('tradicional','realismo','blackwork','acuarela','minimalista','japones') NOT NULL,
  tamano ENUM('pequeno','mediano','grande') NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  duracion_horas DECIMAL(4,1) NOT NULL,
  disponible BOOLEAN NOT NULL DEFAULT TRUE,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT chk_disenos_basico_precio CHECK (precio > 0)
);
