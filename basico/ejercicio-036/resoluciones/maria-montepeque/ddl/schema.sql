-- Campuslands MySQL - basico ejercicio 036
-- Resolucion: maria-montepeque
-- Tema: autos hiperdeportivos
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS hiperdeportivos_basico;

CREATE TABLE hiperdeportivos_basico (
  id_auto INT AUTO_INCREMENT PRIMARY KEY,
  marca VARCHAR(60) NOT NULL,
  modelo VARCHAR(80) NOT NULL,
  anio INT NOT NULL,
  potencia_hp INT NOT NULL,
  velocidad_max_kmh INT NOT NULL,
  precio DECIMAL(12,2) NOT NULL,
  estado ENUM('disponible','vendido','reservado') NOT NULL DEFAULT 'disponible',
  CONSTRAINT chk_hiperdeportivos_basico_precio CHECK (precio > 0),
  CONSTRAINT chk_hiperdeportivos_basico_potencia CHECK (potencia_hp > 0)
);
