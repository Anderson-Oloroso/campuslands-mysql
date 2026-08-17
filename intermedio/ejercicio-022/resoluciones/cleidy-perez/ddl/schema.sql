-- Campuslands MySQL - intermedio ejercicio 022
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS plattform_animacion;
USE plattform_animacion;

-- Tabla 1: Temáticas
CREATE TABLE IF NOT EXISTS tematicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
