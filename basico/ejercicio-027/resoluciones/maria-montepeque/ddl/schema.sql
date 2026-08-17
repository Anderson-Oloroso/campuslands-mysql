-- Campuslands MySQL - basico ejercicio 027
-- Resolucion: maria-montepeque
-- Tema: videojuego de accion y aventura
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS misiones_basico;

-- Entidad principal: una mision de un videojuego de accion y aventura.
-- Se modelan los atributos que realmente distinguen a una mision:
-- tipo, dificultad, region donde ocurre y las recompensas que otorga.
CREATE TABLE misiones_basico (
  id_mision INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(120) NOT NULL UNIQUE,
  tipo_mision ENUM('principal','secundaria','desafio','coleccionable') NOT NULL,
  dificultad ENUM('facil','normal','dificil','extremo') NOT NULL,
  region VARCHAR(80) NOT NULL,
  recompensa_oro INT NOT NULL DEFAULT 0,
  experiencia_otorgada INT NOT NULL DEFAULT 0,
  completada BOOLEAN NOT NULL DEFAULT FALSE,
  CONSTRAINT chk_misiones_basico_oro CHECK (recompensa_oro >= 0),
  CONSTRAINT chk_misiones_basico_experiencia CHECK (experiencia_otorgada >= 0)
);
