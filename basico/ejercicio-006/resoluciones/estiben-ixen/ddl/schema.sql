-- Campuslands MySQL - basico ejercicio-006
-- Tema: autos hiperdeportivos (WHERE)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS autos_hiperdeportivos;

CREATE TABLE autos_hiperdeportivos (
    id_auto INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(70) NOT NULL,
    id_fabricante INT NOT NULL,
    caballos_fuerza INT NOT NULL,
    velocidad_max DECIMAL(6,2) NOT NULL,
    precio_millones DECIMAL(6,2) NOT NULL,
    tipo_motor ENUM('V8 Twin-Turbo','V12 Atmosferico','W16 Quad-Turbo','Electrico Puro','Hibrido') NOT NULL,
    fecha_lanzamiento DATE NOT NULL
);
