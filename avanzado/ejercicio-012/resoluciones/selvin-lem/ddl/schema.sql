-- Ejercicio 012 (Intermedio) - consultas de reportes para playlist musical
-- Ejecutar primero. Orden: schema.sql -> inserts.sql -> consultas.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS reproducciones_playlist;

CREATE TABLE reproducciones_playlist (
  id_cancion INT AUTO_INCREMENT,
  nombre_cancion VARCHAR(150) NOT NULL,
  artista VARCHAR(120) NOT NULL,
  genero ENUM('pop','rock','jazz','electronica','reggaeton') NOT NULL,
  duracion_segundos INT NOT NULL,
  reproducciones INT NOT NULL DEFAULT 0,
  agregada_en DATE NOT NULL,
  CONSTRAINT pk_cancion_playlist PRIMARY KEY (id_cancion),
  CONSTRAINT chk_int012_duracion_valida CHECK (duracion_segundos > 0),
  CONSTRAINT chk_int012_reproducciones_validas CHECK (reproducciones >= 0)
);
