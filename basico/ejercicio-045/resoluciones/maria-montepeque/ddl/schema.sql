-- Campuslands MySQL - basico ejercicio 045
-- Resolucion: maria-montepeque
-- Tema: biblioteca gamer
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS juegos_basico;
DROP TABLE IF EXISTS usuarios_basico;

CREATE TABLE usuarios_basico (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre_usuario VARCHAR(80) NOT NULL UNIQUE,
  plataforma_principal ENUM('pc','playstation','xbox','switch','movil') NOT NULL,
  amigos INT NOT NULL DEFAULT 0,
  CONSTRAINT chk_usuarios_basico_amigos CHECK (amigos >= 0)
);

-- Relacion simple 1 a N: cada juego pertenece a un solo usuario, y un
-- usuario puede tener muchos juegos en su biblioteca.
CREATE TABLE juegos_basico (
  id_juego INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  titulo VARCHAR(150) NOT NULL,
  genero ENUM('accion','rpg','estrategia','deportes','indie') NOT NULL,
  horas_jugadas INT NOT NULL DEFAULT 0,
  precio DECIMAL(8,2) NOT NULL,
  CONSTRAINT fk_juegos_basico_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios_basico (id_usuario),
  CONSTRAINT chk_juegos_basico_horas CHECK (horas_jugadas >= 0),
  CONSTRAINT chk_juegos_basico_precio CHECK (precio > 0)
);
