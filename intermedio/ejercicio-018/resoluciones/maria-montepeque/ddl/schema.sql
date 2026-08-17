-- Campuslands MySQL - intermedio ejercicio 018
-- Resolucion: maria-montepeque
-- Tema: viajes y turismo
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS reservas_intermedio;

CREATE TABLE reservas_intermedio (
  id_reserva INT AUTO_INCREMENT PRIMARY KEY,
  destino VARCHAR(120) NOT NULL,
  categoria ENUM('playa','montana','ciudad','aventura','cultural') NOT NULL,
  viajeros INT NOT NULL,
  precio_total DECIMAL(10,2) NOT NULL,
  fecha_viaje DATE NOT NULL,
  estado ENUM('confirmada','pendiente','cancelada') NOT NULL DEFAULT 'pendiente',
  CONSTRAINT chk_reservas_intermedio_viajeros CHECK (viajeros > 0),
  CONSTRAINT chk_reservas_intermedio_precio CHECK (precio_total > 0)
);
