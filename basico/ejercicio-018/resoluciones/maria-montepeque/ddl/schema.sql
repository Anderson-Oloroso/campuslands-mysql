-- Campuslands MySQL - basico ejercicio 018
-- Resolucion: maria-montepeque
-- Tema: viajes y turismo
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS destinos_basico;

-- Se usa una clave natural (codigo_destino, estilo codigo de aeropuerto)
-- como PRIMARY KEY en vez de un id autoincremental, para practicar el
-- diseño de una llave primaria con significado de negocio.
CREATE TABLE destinos_basico (
  codigo_destino CHAR(3) NOT NULL,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  pais VARCHAR(80) NOT NULL,
  categoria ENUM('playa','montana','ciudad','aventura','cultural') NOT NULL,
  precio_paquete DECIMAL(10,2) NOT NULL,
  calificacion DECIMAL(3,2) NOT NULL DEFAULT 0,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (codigo_destino),
  CONSTRAINT chk_destinos_basico_precio CHECK (precio_paquete > 0),
  CONSTRAINT chk_destinos_basico_calificacion CHECK (calificacion BETWEEN 0 AND 5)
);
