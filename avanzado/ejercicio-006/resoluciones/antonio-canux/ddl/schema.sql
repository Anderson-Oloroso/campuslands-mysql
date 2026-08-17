-- Campuslands MySQL - avanzado ejercicio 006
-- Contexto: Modulo de datos para autos hiperdeportivos (Instruccion EXPLAIN).
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS avanzado_ejercicio_006_hiperdeportivos;
DROP TABLE IF EXISTS avanzado_ejercicio_006_marcas;

CREATE TABLE avanzado_ejercicio_006_marcas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  pais_origen VARCHAR(50) NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE avanzado_ejercicio_006_hiperdeportivos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  marca_id INT NOT NULL,
  modelo VARCHAR(100) NOT NULL,
  caballos_fuerza INT NOT NULL,
  velocidad_maxima INT NOT NULL,
  precio DECIMAL(12,2) NOT NULL,
  FOREIGN KEY (marca_id) REFERENCES avanzado_ejercicio_006_marcas(id)
);
-- Creacion de indices estrategicos para evaluar con EXPLAIN
CREATE INDEX idx_hiperdeportivos_velocidad ON avanzado_ejercicio_006_hiperdeportivos(velocidad_maxima);
CREATE INDEX idx_marcas_pais ON avanzado_ejercicio_006_marcas(pais_origen);