-- Campuslands MySQL - Básico Ejercicio 012
-- Tema: Modelado de entidad

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS playlists;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE playlists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    propietario VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    cantidad_canciones INT NOT NULL,
    duracion_minutos INT NOT NULL,
    privacidad ENUM('Pública','Privada') NOT NULL DEFAULT 'Pública',
    fecha_creacion DATE NOT NULL,

    CHECK (cantidad_canciones > 0),
    CHECK (duracion_minutos > 0)
);