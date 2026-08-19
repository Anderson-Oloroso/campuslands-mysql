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
=======
USE campuslands_mysql;

DROP TABLE IF EXISTS autos;

CREATE TABLE autos (

    id_auto INT AUTO_INCREMENT PRIMARY KEY,

    marca VARCHAR(50) NOT NULL,

    modelo VARCHAR(60) NOT NULL,

    pais_origen VARCHAR(50) NOT NULL,

    anio YEAR NOT NULL,

    velocidad_maxima INT NOT NULL CHECK (velocidad_maxima > 0),

    potencia_hp INT NOT NULL CHECK (potencia_hp > 0),

    precio DECIMAL(12,2) NOT NULL CHECK (precio > 0),

    estado ENUM('Disponible','Reservado','Vendido') NOT NULL,

    fecha_fabricacion DATE NOT NULL

);
