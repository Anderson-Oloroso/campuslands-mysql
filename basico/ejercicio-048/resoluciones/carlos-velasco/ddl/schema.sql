CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE destinos_turisticos (
    id_destino INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(60) NOT NULL,
    ciudad VARCHAR(60) NOT NULL,
    tipo_destino VARCHAR(50) NOT NULL,
    precio_promedio DECIMAL(10, 2) NOT NULL,
    fecha_recomendacion DATE NOT NULL,
    disponible BOOLEAN NOT NULL DEFAULT TRUE,
    CHECK (precio_promedio >= 0)
);