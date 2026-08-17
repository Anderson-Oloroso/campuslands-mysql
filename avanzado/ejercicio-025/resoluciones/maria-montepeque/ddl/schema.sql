-- Campuslands MySQL - avanzado ejercicio 025
-- Resolucion: maria-montepeque
-- Tema: laboratorio de formulas quimicas
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS compuestos_avanzado;

CREATE TABLE compuestos_avanzado (
  id_compuesto INT AUTO_INCREMENT PRIMARY KEY,
  formula VARCHAR(20) NOT NULL UNIQUE,
  nombre VARCHAR(120) NOT NULL,
  categoria ENUM('acido','base','sal','oxido','organico') NOT NULL,
  peso_molecular DECIMAL(8,3) NOT NULL,
  estado_fisico ENUM('solido','liquido','gaseoso') NOT NULL,
  CONSTRAINT chk_compuestos_avanzado_peso CHECK (peso_molecular > 0)
);
