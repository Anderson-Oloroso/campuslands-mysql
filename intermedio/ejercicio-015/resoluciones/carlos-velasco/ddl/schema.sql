-- Campuslands MySQL - Intermedio Ejercicio 015
-- Tema: Carga de datos

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS prestamos;
DROP TABLE IF EXISTS videojuegos;

SET FOREIGN_KEY_CHECKS = 1;

-- Tabla de videojuegos
CREATE TABLE videojuegos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    plataforma ENUM('PC','PlayStation','Xbox','Nintendo Switch') NOT NULL,
    genero VARCHAR(60) NOT NULL,
    desarrollador VARCHAR(100) NOT NULL,
    anio_lanzamiento YEAR NOT NULL,
    estado ENUM('Disponible','Prestado','Mantenimiento') NOT NULL DEFAULT 'Disponible',

    CHECK(anio_lanzamiento >= 1980)
);

-- Tabla de préstamos
CREATE TABLE prestamos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    videojuego_id INT NOT NULL,
    usuario VARCHAR(100) NOT NULL,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    estado ENUM('Activo','Devuelto') NOT NULL DEFAULT 'Activo',

    FOREIGN KEY(videojuego_id)
        REFERENCES videojuegos(id)
);