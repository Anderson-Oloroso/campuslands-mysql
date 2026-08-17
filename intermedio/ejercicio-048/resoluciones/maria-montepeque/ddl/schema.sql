-- Campuslands MySQL - intermedio ejercicio 048
-- Resolucion: maria-montepeque
-- Tema: viajes y turismo
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS reservas_viajes_intermedio;

CREATE TABLE reservas_viajes_intermedio (
  id_reserva INT AUTO_INCREMENT PRIMARY KEY,
  nombre_paquete VARCHAR(120) NOT NULL,
  destino VARCHAR(80) NOT NULL,
  categoria ENUM('playa','montana','ciudad','aventura','crucero') NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  cliente VARCHAR(80) NOT NULL,
  fecha_reserva DATE NOT NULL,
  CONSTRAINT chk_reservas_viajes_intermedio_precio CHECK (precio > 0)
);
