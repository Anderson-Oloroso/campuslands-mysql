-- Ejercicio 015 - relaciones simples para biblioteca gamer
-- Ejecutar primero. Orden: schema.sql -> inserts.sql -> consultas.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_015;
DROP TABLE IF EXISTS desarrolladoras_015;

CREATE TABLE desarrolladoras_015 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  pais VARCHAR(80) NOT NULL
);

CREATE TABLE basico_ejercicio_015 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  genero ENUM('accion','rpg','estrategia','deportes','indie') NOT NULL,
  desarrolladora_id INT NOT NULL,
  horas_jugadas DECIMAL(6,1) NOT NULL DEFAULT 0,
  estado ENUM('pendiente','jugando','completado') NOT NULL DEFAULT 'pendiente',
  agregado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT chk_horas_jugadas_validas CHECK (horas_jugadas >= 0),
  CONSTRAINT fk_juego_desarrolladora
    FOREIGN KEY (desarrolladora_id) REFERENCES desarrolladoras_015 (id)
);
