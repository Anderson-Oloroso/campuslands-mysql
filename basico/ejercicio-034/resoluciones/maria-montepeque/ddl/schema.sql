-- Campuslands MySQL - basico ejercicio 034
-- Resolucion: maria-montepeque
-- Tema: garaje de motos
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS servicios_moto_basico;

CREATE TABLE servicios_moto_basico (
  id_servicio INT AUTO_INCREMENT PRIMARY KEY,
  moto_marca VARCHAR(60) NOT NULL,
  moto_modelo VARCHAR(60) NOT NULL,
  tipo_servicio ENUM('mantenimiento','reparacion','cambio_aceite','revision_general','personalizacion') NOT NULL,
  mecanico VARCHAR(80) NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  fecha_servicio DATE NOT NULL,
  CONSTRAINT chk_servicios_moto_basico_costo CHECK (costo > 0)
);
