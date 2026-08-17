-- Campuslands MySQL - basico ejercicio 038
-- Resolucion: maria-montepeque
-- Tema: futbol sala
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_futsal_basico;

CREATE TABLE jugadores_futsal_basico (
  id_jugador INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL UNIQUE,
  equipo VARCHAR(60) NOT NULL,
  posicion ENUM('portero','cierre','ala','pivote') NOT NULL,
  goles INT NOT NULL DEFAULT 0,
  tarjetas_amarillas INT NOT NULL DEFAULT 0,
  precio_ficha DECIMAL(10,2) NOT NULL,
  categoria ENUM('estrella','regular','banca') NOT NULL DEFAULT 'regular',
  estado ENUM('activo','lesionado','suspendido') NOT NULL DEFAULT 'activo',
  actualizado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT chk_jugadores_futsal_basico_ficha CHECK (precio_ficha > 0),
  CONSTRAINT chk_jugadores_futsal_basico_goles CHECK (goles >= 0),
  CONSTRAINT chk_jugadores_futsal_basico_tarjetas CHECK (tarjetas_amarillas >= 0)
);
