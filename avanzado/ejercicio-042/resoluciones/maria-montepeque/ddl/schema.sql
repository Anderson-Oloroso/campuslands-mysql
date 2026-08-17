-- Campuslands MySQL - avanzado ejercicio 042
-- Resolucion: maria-montepeque
-- Tema: playlist musical
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS reproducciones_avanzado;

CREATE TABLE reproducciones_avanzado (
  id_reproduccion INT AUTO_INCREMENT PRIMARY KEY,
  usuario VARCHAR(80) NOT NULL,
  cancion VARCHAR(120) NOT NULL,
  segundos_escuchados INT NOT NULL,
  resultado ENUM('completa','saltada') NOT NULL,
  duracion_total_seg INT NOT NULL,
  fecha DATE NOT NULL,
  CONSTRAINT chk_reproducciones_avanzado_segundos CHECK (segundos_escuchados > 0),
  CONSTRAINT chk_reproducciones_avanzado_duracion CHECK (duracion_total_seg > 0)
);
