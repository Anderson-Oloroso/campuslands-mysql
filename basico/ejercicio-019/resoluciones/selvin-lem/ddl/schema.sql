-- Ejercicio 019 - INSERT para paracaidismo
-- Ejecutar primero. Orden: schema.sql -> inserts.sql -> consultas.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS saltos_paracaidismo;

CREATE TABLE saltos_paracaidismo (
  id_salto INT AUTO_INCREMENT,
  nombre_paracaidista VARCHAR(120) NOT NULL,
  nivel ENUM('principiante','intermedio','avanzado','instructor') NOT NULL,
  altitud_metros INT NOT NULL,
  duracion_caida_segundos INT NOT NULL,
  costo_salto DECIMAL(8,2) NOT NULL,
  fecha_salto DATE NOT NULL,
  CONSTRAINT pk_salto_paracaidismo PRIMARY KEY (id_salto),
  CONSTRAINT chk_019_altitud_valida CHECK (altitud_metros > 0),
  CONSTRAINT chk_019_costo_valido CHECK (costo_salto >= 0)
);
