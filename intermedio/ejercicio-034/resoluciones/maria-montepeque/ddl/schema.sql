-- Campuslands MySQL - intermedio ejercicio 034
-- Resolucion: maria-montepeque
-- Tema: garaje de motos
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS servicios_taller_intermedio;

CREATE TABLE servicios_taller_intermedio (
  id_servicio INT AUTO_INCREMENT PRIMARY KEY,
  mecanico VARCHAR(80) NOT NULL,
  moto_marca VARCHAR(60) NOT NULL,
  tipo_servicio ENUM('mantenimiento','reparacion','cambio_aceite','revision_general','personalizacion') NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  fecha_servicio DATE NOT NULL,
  estado ENUM('completado','en_proceso','cancelado') NOT NULL DEFAULT 'completado',
  CONSTRAINT chk_servicios_taller_intermedio_costo CHECK (costo > 0)
);
