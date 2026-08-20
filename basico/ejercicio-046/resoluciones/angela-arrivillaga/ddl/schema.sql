CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE productos_urbana (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria ENUM('hamburguesa', 'perro_caliente', 'salchipapa', 'taco', 'bebida') NOT NULL,
    precio DECIMAL(8, 2) NOT NULL,
    calificacion DECIMAL(3, 1) NOT NULL,
    estado ENUM('disponible', 'agotado', 'descontinuado') DEFAULT 'disponible',
    CONSTRAINT chk_precio_urbana CHECK (precio > 0),
    CONSTRAINT chk_calificacion_urbana CHECK (calificacion BETWEEN 0 AND 10)
);