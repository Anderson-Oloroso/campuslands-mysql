-- Campuslands MySQL - intermedio ejercicio 020
-- Resolucion: maria-montepeque
-- Tema: estudio de tatuajes
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Nombres con sufijo "_estudio" para no chocar con clientes_intermedio
-- del ejercicio-016 (misma base de datos compartida campuslands_mysql).
DROP TABLE IF EXISTS citas_estudio_intermedio;
DROP TABLE IF EXISTS clientes_estudio_intermedio;

CREATE TABLE clientes_estudio_intermedio (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  ciudad VARCHAR(80) NOT NULL
);

CREATE TABLE citas_estudio_intermedio (
  id_cita INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  tatuador VARCHAR(80) NOT NULL,
  estilo ENUM('tradicional','realismo','blackwork','acuarela','minimalista','japones') NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  fecha_cita DATE NOT NULL,
  estado ENUM('agendada','realizada','cancelada') NOT NULL DEFAULT 'agendada',
  CONSTRAINT fk_citas_estudio_intermedio_cliente FOREIGN KEY (id_cliente) REFERENCES clientes_estudio_intermedio (id_cliente),
  CONSTRAINT chk_citas_estudio_intermedio_precio CHECK (precio > 0)
);
