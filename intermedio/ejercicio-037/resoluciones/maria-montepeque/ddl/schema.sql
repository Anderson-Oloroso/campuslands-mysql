-- Campuslands MySQL - intermedio ejercicio 037
-- Resolucion: maria-montepeque
-- Tema: liga de futbol
-- Ejecuta este archivo antes de inserts.sql.

-- ===================================================================
-- Diseño que violaria la Segunda Forma Normal (NO se crea, solo de
-- referencia): una clave primaria compuesta (id_partido, id_jugador,
-- minuto) con columnas que dependen solo de una PARTE de esa clave.
--
-- CREATE TABLE goles_mal_disenados (
--   id_partido INT,
--   id_jugador INT,
--   minuto INT,
--   jugador_nombre VARCHAR(80),   -- depende solo de id_jugador
--   jugador_equipo VARCHAR(60),   -- depende solo de id_jugador
--   partido_fecha DATE,           -- depende solo de id_partido
--   partido_estadio VARCHAR(80),  -- depende solo de id_partido
--   PRIMARY KEY (id_partido, id_jugador, minuto)
-- );
--
-- jugador_nombre/jugador_equipo y partido_fecha/partido_estadio no
-- dependen de la clave completa, sino de una parte de ella: eso es una
-- dependencia parcial que viola la 2FN y obliga a repetir esos datos
-- en cada gol registrado.
-- ===================================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS goles_partido_intermedio;
DROP TABLE IF EXISTS partidos_intermedio;
DROP TABLE IF EXISTS jugadores_intermedio;

CREATE TABLE jugadores_intermedio (
  id_jugador INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL UNIQUE,
  equipo VARCHAR(60) NOT NULL
);

CREATE TABLE partidos_intermedio (
  id_partido INT AUTO_INCREMENT PRIMARY KEY,
  equipo_local VARCHAR(60) NOT NULL,
  equipo_visitante VARCHAR(60) NOT NULL,
  fecha_partido DATE NOT NULL,
  estadio VARCHAR(80) NOT NULL
);

-- Tabla de hechos: cada fila es UN gol, con su propia clave (id_gol) y
-- solo columnas que dependen del gol completo (minuto, tipo). Los datos
-- del jugador y del partido viven en sus propias tablas y se enlazan
-- por FK, sin depender de una parte de una clave compuesta.
CREATE TABLE goles_partido_intermedio (
  id_gol INT AUTO_INCREMENT PRIMARY KEY,
  id_partido INT NOT NULL,
  id_jugador INT NOT NULL,
  minuto INT NOT NULL,
  tipo_gol ENUM('normal','penal','autogol') NOT NULL DEFAULT 'normal',
  CONSTRAINT fk_goles_partido_intermedio_partido FOREIGN KEY (id_partido) REFERENCES partidos_intermedio (id_partido),
  CONSTRAINT fk_goles_partido_intermedio_jugador FOREIGN KEY (id_jugador) REFERENCES jugadores_intermedio (id_jugador),
  CONSTRAINT chk_goles_partido_intermedio_minuto CHECK (minuto BETWEEN 1 AND 120)
);
