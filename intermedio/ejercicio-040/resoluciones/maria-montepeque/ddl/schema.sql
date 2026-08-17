-- Campuslands MySQL - intermedio ejercicio 040
-- Resolucion: maria-montepeque
-- Tema: carreras urbanas
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS dorsales_carrera_intermedio;
DROP TABLE IF EXISTS carreras_intermedio;

CREATE TABLE carreras_intermedio (
  id_carrera INT AUTO_INCREMENT PRIMARY KEY,
  codigo_carrera VARCHAR(20) NOT NULL UNIQUE,
  nombre_carrera VARCHAR(120) NOT NULL UNIQUE,
  distancia_km DECIMAL(6,2) NOT NULL,
  ciudad VARCHAR(60) NOT NULL,
  fecha_carrera DATE NOT NULL
);

-- UNIQUE simple arriba: no puede haber dos carreras con el mismo
-- codigo_carrera ni dos con el mismo nombre_carrera.
--
-- UNIQUE compuesta abajo: el mismo numero de dorsal puede repetirse
-- entre carreras distintas (cada evento numera sus dorsales a su
-- manera), pero NO dos veces dentro de la MISMA carrera.
CREATE TABLE dorsales_carrera_intermedio (
  id_dorsal INT AUTO_INCREMENT PRIMARY KEY,
  id_carrera INT NOT NULL,
  numero_dorsal VARCHAR(10) NOT NULL,
  corredor VARCHAR(120) NOT NULL,
  tiempo_minutos DECIMAL(6,2) NOT NULL,
  CONSTRAINT fk_dorsales_carrera_intermedio_carrera FOREIGN KEY (id_carrera) REFERENCES carreras_intermedio (id_carrera),
  CONSTRAINT uq_dorsales_carrera_intermedio UNIQUE (id_carrera, numero_dorsal),
  CONSTRAINT chk_dorsales_carrera_intermedio_tiempo CHECK (tiempo_minutos > 0)
);
