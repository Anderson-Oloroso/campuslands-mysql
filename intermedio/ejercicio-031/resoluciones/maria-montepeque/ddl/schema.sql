-- Campuslands MySQL - intermedio ejercicio 031
-- Resolucion: maria-montepeque
-- Tema: torneo esports MOBA
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS partidas_intermedio;
DROP TABLE IF EXISTS equipos_intermedio;

CREATE TABLE equipos_intermedio (
  id_equipo INT AUTO_INCREMENT PRIMARY KEY,
  nombre_equipo VARCHAR(120) NOT NULL UNIQUE,
  region ENUM('LATAM','NA','EU','KR','CN') NOT NULL
);

-- Dos FOREIGN KEY hacia la MISMA tabla: cada partida enfrenta a un
-- equipo local contra un equipo visitante. Para leerla hay que unir
-- equipos_intermedio dos veces, con un alias distinto cada vez.
CREATE TABLE partidas_intermedio (
  id_partida INT AUTO_INCREMENT PRIMARY KEY,
  id_equipo_local INT NOT NULL,
  id_equipo_visitante INT NOT NULL,
  marcador_local INT NOT NULL,
  marcador_visitante INT NOT NULL,
  fase ENUM('grupos','cuartos','semifinal','final') NOT NULL,
  fecha DATE NOT NULL,
  CONSTRAINT fk_partidas_intermedio_local FOREIGN KEY (id_equipo_local) REFERENCES equipos_intermedio (id_equipo),
  CONSTRAINT fk_partidas_intermedio_visitante FOREIGN KEY (id_equipo_visitante) REFERENCES equipos_intermedio (id_equipo),
  CONSTRAINT chk_partidas_intermedio_marcadores CHECK (marcador_local >= 0 AND marcador_visitante >= 0),
  CONSTRAINT chk_partidas_intermedio_rivales CHECK (id_equipo_local <> id_equipo_visitante)
);
