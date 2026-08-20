-- Campuslands MySQL - Intermedio Ejercicio 049
-- Temática: Paracaidismo (Uso de HAVING y Agregaciones Avanzadas)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS saltos;
DROP TABLE IF EXISTS instructores;
DROP TABLE IF EXISTS paracaidistas;
DROP TABLE IF EXISTS zonas_salto;

-- Tabla de paracaidistas (alumnos o saltadores)
CREATE TABLE paracaidistas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    licencia VARCHAR(20) NOT NULL DEFAULT 'Alumno', -- Alumno, A, B, C, D
    fecha_nacimiento DATE NOT NULL
);

-- Tabla de instructores de paracaidismo
CREATE TABLE instructores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    licencia_instructor VARCHAR(30) NOT NULL UNIQUE,
    tarifa_salto DECIMAL(10,2) NOT NULL CHECK (tarifa_salto > 0.00)
);

-- Tabla de zonas de salto (Dropzones)
CREATE TABLE zonas_salto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_dropzone VARCHAR(80) NOT NULL UNIQUE,
    ubicacion VARCHAR(100) NOT NULL,
    altitud_maxima_pies INT NOT NULL CHECK (altitud_maxima_pies >= 5000)
);

-- Tabla de registro de saltos
CREATE TABLE saltos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paracaidista_id INT NOT NULL,
    instructor_id INT,
    dropzone_id INT NOT NULL,
    fecha_salto DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modalidad ENUM('Tandem', 'Solo AFF', 'Formacion', 'Freestyle', 'Wingsuit') NOT NULL,
    altitud_pies INT NOT NULL CHECK (altitud_pies >= 3000),
    tiempo_caida_libre_seg INT NOT NULL CHECK (tiempo_caida_libre_seg >= 0),
    costo DECIMAL(10,2) NOT NULL CHECK (costo >= 0.00),
    estado_salto ENUM('Completado', 'Cancelado', 'Incidente') NOT NULL DEFAULT 'Completado',
    FOREIGN KEY (paracaidista_id) REFERENCES paracaidistas(id) ON DELETE CASCADE,
    FOREIGN KEY (instructor_id) REFERENCES instructores(id) ON DELETE SET NULL,
    FOREIGN KEY (dropzone_id) REFERENCES zonas_salto(id) ON DELETE CASCADE
);