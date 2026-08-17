-- Campuslands MySQL - basico ejercicio 042
-- Resolucion: maria-montepeque
-- Tema: playlist musical
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS canciones_basico;

-- Entidad principal: una cancion dentro de una playlist musical.
-- Se modelan los atributos que realmente distinguen a una cancion:
-- artista, genero, duracion, año de lanzamiento y sus reproducciones.
CREATE TABLE canciones_basico (
  id_cancion INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(120) NOT NULL,
  artista VARCHAR(120) NOT NULL,
  genero ENUM('pop','rock','reggaeton','electronica','jazz','clasica') NOT NULL,
  duracion_seg INT NOT NULL,
  anio_lanzamiento INT NOT NULL,
  reproducciones INT NOT NULL DEFAULT 0,
  favorita BOOLEAN NOT NULL DEFAULT FALSE,
  CONSTRAINT uq_canciones_basico_titulo_artista UNIQUE (titulo, artista),
  CONSTRAINT chk_canciones_basico_duracion CHECK (duracion_seg > 0),
  CONSTRAINT chk_canciones_basico_reproducciones CHECK (reproducciones >= 0)
);
