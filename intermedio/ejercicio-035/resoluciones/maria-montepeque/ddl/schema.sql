-- Campuslands MySQL - intermedio ejercicio 035
-- Resolucion: maria-montepeque
-- Tema: taller mecanico de motos
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS citas_taller_intermedio;
DROP TABLE IF EXISTS clientes_taller_intermedio;

CREATE TABLE clientes_taller_intermedio (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  ciudad VARCHAR(80) NOT NULL
);

CREATE TABLE citas_taller_intermedio (
  id_cita INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  mecanico VARCHAR(80) NOT NULL,
  tipo_servicio ENUM('mantenimiento','reparacion','cambio_aceite','revision_general','personalizacion') NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  fecha_cita DATE NOT NULL,
  estado ENUM('agendada','realizada','cancelada') NOT NULL DEFAULT 'agendada',
  CONSTRAINT fk_citas_taller_intermedio_cliente FOREIGN KEY (id_cliente) REFERENCES clientes_taller_intermedio (id_cliente),
  CONSTRAINT chk_citas_taller_intermedio_costo CHECK (costo > 0)
);
