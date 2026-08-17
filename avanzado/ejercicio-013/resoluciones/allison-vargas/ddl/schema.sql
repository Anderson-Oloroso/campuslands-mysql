-- DDL: Estructura de Películas de Miedo integrando datos semiestructurados en columnas JSON
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS catalogo_terror;

CREATE TABLE catalogo_terror (
    pelicula_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    director VARCHAR(80) NOT NULL,
    anio_estreno INT NOT NULL CHECK (anio_estreno >= 1895),
    clasificacion ENUM('PG-13', 'R', 'NC-17') DEFAULT 'R',
    detalles_json JSON NOT NULL,
    atributos_extra JSON NULL,
    CONSTRAINT chk_json_detalles CHECK (JSON_VALID(detalles_json))
) ENGINE=InnoDB;
