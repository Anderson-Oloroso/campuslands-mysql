-- Campuslands MySQL - basico ejercicio 055
-- Resolucion: maria-montepeque
-- Tema: laboratorio de formulas quimicas
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS pruebas_lab_basico;

CREATE TABLE pruebas_lab_basico (
  id_prueba INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  tipo_reaccion ENUM('sintesis','descomposicion','combustion','neutralizacion','oxidacion') NOT NULL,
  cantidad_muestras INT NOT NULL,
  costo_reactivos DECIMAL(10,2) NOT NULL,
  resultado ENUM('exitoso','fallido','en_analisis') NOT NULL DEFAULT 'en_analisis',
  fecha_prueba DATE NOT NULL,
  CONSTRAINT chk_pruebas_lab_basico_muestras CHECK (cantidad_muestras > 0),
  CONSTRAINT chk_pruebas_lab_basico_costo CHECK (costo_reactivos > 0)
);
