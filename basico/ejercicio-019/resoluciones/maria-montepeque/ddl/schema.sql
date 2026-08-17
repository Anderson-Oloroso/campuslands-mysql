-- Campuslands MySQL - basico ejercicio 019
-- Resolucion: maria-montepeque
-- Tema: paracaidismo
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS saltos_basico;

CREATE TABLE saltos_basico (
  id_salto INT AUTO_INCREMENT PRIMARY KEY,
  paracaidista VARCHAR(120) NOT NULL,
  nivel ENUM('principiante','intermedio','avanzado','instructor') NOT NULL,
  tipo_salto ENUM('tandem','solo','formacion','estilo_libre') NOT NULL,
  altura_metros INT NOT NULL,
  duracion_caida_libre_seg INT NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  fecha_salto DATE NOT NULL,
  CONSTRAINT chk_saltos_basico_altura CHECK (altura_metros > 0),
  CONSTRAINT chk_saltos_basico_costo CHECK (costo > 0)
);
