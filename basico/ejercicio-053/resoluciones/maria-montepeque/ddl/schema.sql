-- Campuslands MySQL - basico ejercicio 053
-- Resolucion: maria-montepeque
-- Tema: arquitectura 3D
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS maquetas_basico;

CREATE TABLE maquetas_basico (
  id_maqueta INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  tipo_construccion ENUM('residencial','comercial','institucional','industrial','paisajismo') NOT NULL,
  software VARCHAR(60) NOT NULL,
  precio DECIMAL(12,2) NOT NULL,
  estado ENUM('boceto','modelado','renderizado','entregado') NOT NULL DEFAULT 'boceto',
  actualizado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT chk_maquetas_basico_precio CHECK (precio > 0)
);
