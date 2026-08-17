-- Campuslands MySQL - intermedio ejercicio 023
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS academia_arquitectura3d;
USE academia_arquitectura3d;

-- 1. Tabla Temáticas
CREATE TABLE IF NOT EXISTS tematicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
