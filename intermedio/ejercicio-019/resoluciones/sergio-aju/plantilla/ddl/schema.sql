-- Campuslands MySQL - Intermedio Ejercicio 019
-- Temática: Paracaidismo (Uso de HAVING)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS saltos_paracaidismo;

CREATE TABLE saltos_paracaidismo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modalidad VARCHAR(80) NOT NULL,
    nivel_experiencia ENUM('Principiante', 'Intermedio', 'Avanzado') NOT NULL DEFAULT 'Principiante',
    altura_pies INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    calificacion DECIMAL(3,2) NOT NULL DEFAULT 0.00,
    zona_salto VARCHAR(80) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
);