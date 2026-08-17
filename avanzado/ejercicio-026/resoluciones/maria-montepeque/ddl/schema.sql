-- Campuslands MySQL - avanzado ejercicio 026
-- Resolucion: maria-montepeque
-- Tema: videojuego RPG
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS habilidades_avanzado;

CREATE TABLE habilidades_avanzado (
  id_habilidad INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  clase ENUM('guerrero','mago','arquero','picaro','clerigo') NOT NULL,
  nivel_requerido INT NOT NULL,
  id_habilidad_previa INT NULL,
  CONSTRAINT fk_habilidades_avanzado_previa FOREIGN KEY (id_habilidad_previa) REFERENCES habilidades_avanzado (id_habilidad),
  CONSTRAINT chk_habilidades_avanzado_nivel CHECK (nivel_requerido BETWEEN 1 AND 100)
);
