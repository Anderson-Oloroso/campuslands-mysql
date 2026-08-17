-- Campuslands MySQL - intermedio ejercicio 049
-- Resolucion: maria-montepeque
-- Tema: paracaidismo
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS saltos_club_intermedio;

CREATE TABLE saltos_club_intermedio (
  id_salto INT AUTO_INCREMENT PRIMARY KEY,
  instructor VARCHAR(80) NOT NULL,
  paracaidista VARCHAR(80) NOT NULL,
  tipo_salto ENUM('tandem','estabilidad','formacion','free_fly','precision') NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  fecha_salto DATE NOT NULL,
  estado ENUM('completado','en_proceso','cancelado') NOT NULL DEFAULT 'completado',
  CONSTRAINT chk_saltos_club_intermedio_costo CHECK (costo > 0)
);
