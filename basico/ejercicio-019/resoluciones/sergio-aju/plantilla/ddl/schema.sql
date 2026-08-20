-- Campuslands MySQL - Básico Ejercicio 019
-- Temática: Paracaidismo (Uso de INSERT)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS saltos_paracaidismo;

CREATE TABLE saltos_paracaidismo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modalidad VARCHAR(80) NOT NULL,
    altura_pies INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    nivel_experiencia ENUM('Principiante', 'Intermedio', 'Avanzado') NOT NULL DEFAULT 'Principiante',
    calificacion DECIMAL(3,2) NOT NULL DEFAULT 0.00,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
);