-- Campuslands MySQL - intermedio ejercicio-049
-- Tema: paracaidismo (HAVING)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS saltos_registrados;
DROP TABLE IF EXISTS zonas_salto;

CREATE TABLE zonas_salto (
    id_zona INT AUTO_INCREMENT PRIMARY KEY,
    nombre_zona VARCHAR(60) NOT NULL UNIQUE,
    altitud_pista_metros INT NOT NULL,
    pais VARCHAR(40) NOT NULL
);

CREATE TABLE saltos_registrados (
    id_salto INT AUTO_INCREMENT PRIMARY KEY,
    paracaidista VARCHAR(70) NOT NULL,
    tipo_salto ENUM('Tandem','Solo AFF','Wingsuit','Formacion BFR','HALO') NOT NULL,
    id_zona INT NOT NULL,
    altitud_salto_pies INT NOT NULL,
    tiempo_caida_libre_seg INT NOT NULL,
    costo_salto DECIMAL(7,2) NOT NULL,
    fecha_salto DATETIME NOT NULL,
    FOREIGN KEY (id_zona) REFERENCES zonas_salto(id_zona) ON DELETE CASCADE
);
