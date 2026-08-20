-- Campuslands MySQL - basico ejercicio 019
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE saltos_paracaidismo (
    id_salto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_paracaidista VARCHAR(100) NOT NULL,
    modalidad ENUM('Tándem', 'Solo', 'AFF', 'Wingsuit') NOT NULL,
    altitud_pies INT NOT NULL CHECK (altitud_pies >= 3000),
    tiempo_caida_libre_seg INT NOT NULL CHECK (tiempo_caida_libre_seg >= 0),
    lugar_zona_salto VARCHAR(100) NOT NULL,
    fecha_salto DATETIME DEFAULT CURRENT_TIMESTAMP
);
