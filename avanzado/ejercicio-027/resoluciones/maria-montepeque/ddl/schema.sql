-- Campuslands MySQL - avanzado ejercicio 027
-- Resolucion: maria-montepeque
-- Tema: videojuego de accion y aventura
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS enfrentamientos_avanzado;

CREATE TABLE enfrentamientos_avanzado (
  id_enfrentamiento INT AUTO_INCREMENT PRIMARY KEY,
  jugador VARCHAR(80) NOT NULL,
  jefe VARCHAR(80) NOT NULL,
  danio_infligido INT NOT NULL,
  resultado ENUM('victoria','derrota') NOT NULL,
  duracion_seg INT NOT NULL,
  fecha DATE NOT NULL,
  CONSTRAINT chk_enfrentamientos_avanzado_danio CHECK (danio_infligido > 0),
  CONSTRAINT chk_enfrentamientos_avanzado_duracion CHECK (duracion_seg > 0)
);
