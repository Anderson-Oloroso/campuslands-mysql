-- Campuslands MySQL - basico ejercicio-049
-- Tema: paracaidismo (INSERT)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS saltos_registrados;

CREATE TABLE saltos_registrados (
    id_salto INT AUTO_INCREMENT PRIMARY KEY,
    paracaidista VARCHAR(70) NOT NULL,
    tipo_salto ENUM('Tandem','Solo AFF','Wingsuit','Formacion BFR','HALO') NOT NULL,
    id_zona INT NOT NULL,
    altitud_salto_pies INT NOT NULL,
    tiempo_caida_libre_seg INT NOT NULL,
    costo_salto DECIMAL(7,2) NOT NULL,
    fecha_salto DATETIME NOT NULL
);
