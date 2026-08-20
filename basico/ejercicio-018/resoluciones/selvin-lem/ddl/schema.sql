-- Ejercicio 018 - PRIMARY KEY para viajes y turismo
-- Ejecutar primero. Orden: schema.sql -> inserts.sql -> consultas.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS destinos_turisticos;

CREATE TABLE destinos_turisticos (
  id_destino INT AUTO_INCREMENT,
  nombre_destino VARCHAR(150) NOT NULL,
  pais VARCHAR(80) NOT NULL,
  tipo_destino ENUM('playa','montaña','ciudad','cultural','aventura') NOT NULL,
  costo_paquete DECIMAL(10,2) NOT NULL,
  cupos_disponibles INT NOT NULL DEFAULT 0,
  fecha_salida DATE NOT NULL,
  CONSTRAINT pk_destino_turistico PRIMARY KEY (id_destino),
  CONSTRAINT chk_018_costo_valido CHECK (costo_paquete > 0),
  CONSTRAINT chk_018_cupos_validos CHECK (cupos_disponibles >= 0)
);
