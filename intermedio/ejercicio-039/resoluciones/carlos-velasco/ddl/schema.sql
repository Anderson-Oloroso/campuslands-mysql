CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE entrenadores (
    id_entrenador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(80) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
);

CREATE TABLE peleadores (
    id_peleador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad TINYINT UNSIGNED NOT NULL,
    categoria_peso VARCHAR(40) NOT NULL,
    victorias SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    derrotas SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    id_entrenador INT UNSIGNED NOT NULL,

    CONSTRAINT fk_peleador_entrenador
        FOREIGN KEY (id_entrenador)
        REFERENCES entrenadores(id_entrenador)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_edad_peleador
        CHECK (edad BETWEEN 18 AND 50),

    CONSTRAINT chk_victorias
        CHECK (victorias >= 0),

    CONSTRAINT chk_derrotas
        CHECK (derrotas >= 0)
);