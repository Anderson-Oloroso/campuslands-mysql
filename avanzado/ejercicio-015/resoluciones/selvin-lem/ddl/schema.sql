-- Ejercicio 015 (Intermedio) - carga de datos para biblioteca gamer
-- Ejecutar primero. Orden: schema.sql -> inserts.sql -> consultas.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS resumen_completados_gamer;
DROP TABLE IF EXISTS coleccion_juegos;

CREATE TABLE coleccion_juegos (
  id_juego INT AUTO_INCREMENT,
  titulo VARCHAR(150) NOT NULL,
  plataforma ENUM('pc','playstation','xbox','switch') NOT NULL,
  horas_jugadas DECIMAL(6,1) NOT NULL DEFAULT 0,
  completado ENUM('si','no') NOT NULL DEFAULT 'no',
  fecha_adquisicion DATE NOT NULL,
  CONSTRAINT pk_juego_coleccion PRIMARY KEY (id_juego),
  CONSTRAINT chk_int015_horas_validas CHECK (horas_jugadas >= 0)
);

-- Tabla de resumen, se carga a partir de coleccion_juegos (INSERT ... SELECT)
CREATE TABLE resumen_completados_gamer (
  plataforma ENUM('pc','playstation','xbox','switch') NOT NULL,
  total_completados INT NOT NULL,
  horas_totales DECIMAL(8,1) NOT NULL,
  CONSTRAINT pk_resumen_plataforma PRIMARY KEY (plataforma)
);
