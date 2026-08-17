-- Campuslands MySQL - basico ejercicio 037
-- Resolucion: maria-montepeque
-- Tema: liga de futbol
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_basico;

CREATE TABLE jugadores_basico (
  id_jugador INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL,
  equipo VARCHAR(60) NOT NULL,
  posicion ENUM('portero','defensa','mediocampista','delantero') NOT NULL,
  goles INT NOT NULL DEFAULT 0,
  edad INT NOT NULL,
  salario DECIMAL(12,2) NOT NULL,
  estado ENUM('activo','lesionado','suspendido') NOT NULL DEFAULT 'activo',
  CONSTRAINT chk_jugadores_basico_edad CHECK (edad > 0),
  CONSTRAINT chk_jugadores_basico_salario CHECK (salario > 0),
  CONSTRAINT chk_jugadores_basico_goles CHECK (goles >= 0)
);
