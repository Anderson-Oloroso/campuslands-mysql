CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS peleadores;
DROP TABLE IF EXISTS categorias;

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    peso_minimo DECIMAL(5,2) NOT NULL,
    peso_maximo DECIMAL(5,2) NOT NULL,
    CONSTRAINT uq_categorias_nombre UNIQUE (nombre),
    CONSTRAINT chk_categorias_peso CHECK (peso_minimo > 0),
    CONSTRAINT chk_categorias_rango CHECK (peso_maximo > peso_minimo)
);

CREATE TABLE peleadores (
    id_peleador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    edad TINYINT UNSIGNED NOT NULL,
    peso DECIMAL(5,2) NOT NULL,
    victorias INT UNSIGNED NOT NULL DEFAULT 0,
    derrotas INT UNSIGNED NOT NULL DEFAULT 0,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    id_categoria INT NOT NULL,
    CONSTRAINT chk_peleadores_edad CHECK (edad BETWEEN 16 AND 50),
    CONSTRAINT chk_peleadores_peso CHECK (peso > 0),
    CONSTRAINT fk_peleadores_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);