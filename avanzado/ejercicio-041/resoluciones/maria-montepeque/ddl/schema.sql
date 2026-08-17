-- Campuslands MySQL - avanzado ejercicio 041
-- Resolucion: maria-montepeque
-- Tema: pingpong
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS tecnicas_pingpong_avanzado;

CREATE TABLE tecnicas_pingpong_avanzado (
  id_tecnica INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  categoria ENUM('ataque','defensa','saque','efecto') NOT NULL,
  nivel_requerido INT NOT NULL,
  id_tecnica_previa INT NULL,
  CONSTRAINT fk_tecnicas_pingpong_avanzado_previa FOREIGN KEY (id_tecnica_previa) REFERENCES tecnicas_pingpong_avanzado (id_tecnica),
  CONSTRAINT chk_tecnicas_pingpong_avanzado_nivel CHECK (nivel_requerido BETWEEN 1 AND 100)
);
