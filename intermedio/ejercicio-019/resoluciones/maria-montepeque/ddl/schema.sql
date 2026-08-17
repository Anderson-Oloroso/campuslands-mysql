-- Campuslands MySQL - intermedio ejercicio 019
-- Resolucion: maria-montepeque
-- Tema: paracaidismo
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS saltos_intermedio;

CREATE TABLE saltos_intermedio (
  id_salto INT AUTO_INCREMENT PRIMARY KEY,
  instructor VARCHAR(120) NOT NULL,
  alumno VARCHAR(120) NOT NULL,
  tipo_salto ENUM('tandem','solo','formacion','estilo_libre') NOT NULL,
  altura_metros INT NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  fecha_salto DATE NOT NULL,
  estado ENUM('completado','cancelado','reprogramado') NOT NULL DEFAULT 'completado',
  CONSTRAINT chk_saltos_intermedio_altura CHECK (altura_metros > 0),
  CONSTRAINT chk_saltos_intermedio_costo CHECK (costo > 0)
);
