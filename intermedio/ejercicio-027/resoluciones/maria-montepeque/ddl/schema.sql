-- Campuslands MySQL - intermedio ejercicio 027
-- Resolucion: maria-montepeque
-- Tema: videojuego de accion y aventura
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS sesiones_juego_intermedio;

CREATE TABLE sesiones_juego_intermedio (
  id_sesion INT AUTO_INCREMENT PRIMARY KEY,
  jugador VARCHAR(80) NOT NULL,
  dificultad ENUM('facil','normal','dificil') NOT NULL,
  nivel_alcanzado INT NOT NULL,
  enemigos_derrotados INT NOT NULL,
  muertes INT NOT NULL,
  duracion_min INT NOT NULL,
  fecha_sesion DATE NOT NULL,
  CONSTRAINT chk_sesiones_intermedio_nivel CHECK (nivel_alcanzado > 0),
  CONSTRAINT chk_sesiones_intermedio_duracion CHECK (duracion_min > 0)
);
