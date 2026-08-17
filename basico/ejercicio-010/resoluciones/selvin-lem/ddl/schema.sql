CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS carreras_urbanas_pilotos;

CREATE TABLE carreras_urbanas_pilotos (
  id_piloto INT AUTO_INCREMENT PRIMARY KEY,
  nombre_piloto VARCHAR(50) NOT NULL,
  categoria_auto ENUM('compacto','deportivo','muscle_car','tuner') NOT NULL,
  carreras_ganadas SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  premio_acumulado DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  fecha_ultima_carrera DATE NOT NULL,
  estado ENUM('activo','sancionado') NOT NULL DEFAULT 'activo'
);