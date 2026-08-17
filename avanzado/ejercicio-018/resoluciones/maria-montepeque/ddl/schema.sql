-- Campuslands MySQL - avanzado ejercicio 018
-- Resolucion: maria-montepeque
-- Tema: viajes y turismo
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS itinerarios_avanzado;

CREATE TABLE itinerarios_avanzado (
  id_itinerario INT AUTO_INCREMENT PRIMARY KEY,
  viajero_nombre VARCHAR(120) NOT NULL,
  viajero_email VARCHAR(160) NOT NULL,
  destino VARCHAR(120) NOT NULL,
  fecha_salida DATE NOT NULL,
  fecha_regreso DATE NOT NULL,
  precio_base DECIMAL(10,2) NOT NULL,
  descuento_pct DECIMAL(5,2) NOT NULL DEFAULT 0,
  CONSTRAINT chk_itinerarios_avanzado_precio CHECK (precio_base > 0),
  CONSTRAINT chk_itinerarios_avanzado_descuento CHECK (descuento_pct BETWEEN 0 AND 100),
  CONSTRAINT chk_itinerarios_avanzado_fechas CHECK (fecha_regreso > fecha_salida)
);
