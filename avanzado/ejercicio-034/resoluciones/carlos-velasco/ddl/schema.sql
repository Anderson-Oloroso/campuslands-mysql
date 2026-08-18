CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS auditoria_mantenimientos;
DROP TABLE IF EXISTS mantenimientos;
DROP TABLE IF EXISTS motos;

CREATE TABLE motos (
    id_moto INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    cilindrada INT NOT NULL,
    kilometraje INT NOT NULL DEFAULT 0,
    estado ENUM('disponible', 'mantenimiento', 'fuera_servicio')
        NOT NULL DEFAULT 'disponible',

    CONSTRAINT chk_cilindrada
        CHECK (cilindrada > 0),

    CONSTRAINT chk_kilometraje
        CHECK (kilometraje >= 0)
);

CREATE TABLE mantenimientos (
    id_mantenimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_moto INT NOT NULL,
    tipo_mantenimiento VARCHAR(100) NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    fecha_mantenimiento DATE NOT NULL,
    kilometraje INT NOT NULL,

    CONSTRAINT fk_mantenimiento_moto
        FOREIGN KEY (id_moto)
        REFERENCES motos(id_moto),

    CONSTRAINT chk_costo_mantenimiento
        CHECK (costo >= 0),

    CONSTRAINT chk_kilometraje_mantenimiento
        CHECK (kilometraje >= 0)
);

CREATE TABLE auditoria_mantenimientos (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_mantenimiento INT NOT NULL,
    id_moto INT NOT NULL,
    tipo_mantenimiento VARCHAR(100) NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_auditoria_mantenimiento
        FOREIGN KEY (id_mantenimiento)
        REFERENCES mantenimientos(id_mantenimiento),

    CONSTRAINT fk_auditoria_moto
        FOREIGN KEY (id_moto)
        REFERENCES motos(id_moto)
);