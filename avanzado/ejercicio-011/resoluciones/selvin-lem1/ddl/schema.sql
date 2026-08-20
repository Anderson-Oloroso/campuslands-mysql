-- Ejercicio 011 (Intermedio) - CHECK para pingpong
-- Ejecutar primero. Orden: schema.sql -> inserts.sql -> consultas.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS partidos_pingpong;

CREATE TABLE partidos_pingpong (
  id_partido INT AUTO_INCREMENT,
  jugador_local VARCHAR(120) NOT NULL,
  jugador_visitante VARCHAR(120) NOT NULL,
  sets_local INT NOT NULL,
  sets_visitante INT NOT NULL,
  estado ENUM('programado','jugado','suspendido') NOT NULL DEFAULT 'programado',
  fecha_partido DATE NOT NULL,
  CONSTRAINT pk_partido_pingpong PRIMARY KEY (id_partido),
  CONSTRAINT chk_int011_sets_local CHECK (sets_local BETWEEN 0 AND 5),
  CONSTRAINT chk_int011_sets_visitante CHECK (sets_visitante BETWEEN 0 AND 5),
  CONSTRAINT chk_int011_jugadores_distintos CHECK (jugador_local <> jugador_visitante)
);
