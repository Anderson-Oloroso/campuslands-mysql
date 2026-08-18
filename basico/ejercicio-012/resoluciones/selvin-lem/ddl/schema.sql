-- Ejercicio 012 - modelado de entidad para playlist musical
-- Ejecutar primero. Orden: schema.sql -> inserts.sql -> consultas.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_012;

CREATE TABLE basico_ejercicio_012 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cancion VARCHAR(150) NOT NULL,
    artista VARCHAR(120) NOT NULL,
    genero ENUM('pop','rock','jazz','electronica','reggaeton') NOT NULL,
    duracion_segundos INT NOT NULL,
    favorito ENUM('si','no') NOT NULL DEFAULT 'no',
    agregada_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_duracion_valida CHECK (duracion_segundos > 0)
);