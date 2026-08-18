-- Campuslands MySQL - avanzado ejercicio-036
-- Tema: autos hiperdeportivos (EXPLAIN)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS log_auditoria_hiperdeportivos;
DROP TABLE IF EXISTS autos_hiperdeportivos;
DROP TABLE IF EXISTS fabricantes_autos;

CREATE TABLE fabricantes_autos (
    id_fabricante INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL UNIQUE,
    pais_origen VARCHAR(40) NOT NULL,
    fundacion INT NOT NULL,
    estado ENUM('Activo','Inactivo') DEFAULT 'Activo'
);

CREATE TABLE autos_hiperdeportivos (
    id_auto INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(70) NOT NULL,
    id_fabricante INT NOT NULL,
    caballos_fuerza INT NOT NULL,
    velocidad_max DECIMAL(6,2) NOT NULL,
    precio_millones DECIMAL(6,2) NOT NULL,
    tipo_motor ENUM('V8 Twin-Turbo','V12 Atmosferico','W16 Quad-Turbo','Electrico Puro','Hibrido') NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    FOREIGN KEY (id_fabricante) REFERENCES fabricantes_autos(id_fabricante) ON DELETE CASCADE
);
