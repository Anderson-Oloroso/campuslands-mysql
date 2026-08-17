-- Campuslands MySQL - intermedio ejercicio 038
-- Resolucion: maria-montepeque
-- Tema: futbol sala
-- Ejecuta este archivo antes de inserts.sql.

-- ===================================================================
-- Diseño que violaria la Tercera Forma Normal (NO se crea, solo de
-- referencia):
--
-- CREATE TABLE jugadores_mal_disenados (
--   id_jugador INT PRIMARY KEY,
--   nombre VARCHAR(80),
--   goles INT,
--   id_equipo INT,
--   equipo_nombre VARCHAR(80),  -- depende de id_equipo, no de id_jugador
--   equipo_ciudad VARCHAR(60)   -- depende de id_equipo, no de id_jugador
-- );
--
-- equipo_nombre y equipo_ciudad dependen de un atributo NO llave
-- (id_equipo), no directamente de la llave primaria (id_jugador): esa
-- es la dependencia transitiva que prohibe la 3FN. Ademas, si un
-- equipo tiene 5 jugadores, su nombre y ciudad quedarian repetidos 5
-- veces y desincronizados apenas alguien actualizara solo una fila.
-- ===================================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_futsal_intermedio;
DROP TABLE IF EXISTS equipos_futsal_intermedio;

CREATE TABLE equipos_futsal_intermedio (
  id_equipo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL UNIQUE,
  ciudad VARCHAR(60) NOT NULL
);

-- id_equipo depende de id_jugador (cada jugador pertenece a un
-- equipo), pero equipo_nombre y equipo_ciudad ya NO estan aqui: viven
-- en equipos_futsal_intermedio y se consultan con JOIN. Asi cada
-- atributo depende directamente de la llave primaria, sin pasos
-- intermedios.
CREATE TABLE jugadores_futsal_intermedio (
  id_jugador INT AUTO_INCREMENT PRIMARY KEY,
  id_equipo INT NOT NULL,
  nombre VARCHAR(80) NOT NULL,
  posicion ENUM('portero','cierre','ala','pivote') NOT NULL,
  goles INT NOT NULL DEFAULT 0,
  CONSTRAINT fk_jugadores_futsal_intermedio_equipo FOREIGN KEY (id_equipo) REFERENCES equipos_futsal_intermedio (id_equipo),
  CONSTRAINT chk_jugadores_futsal_intermedio_goles CHECK (goles >= 0)
);
