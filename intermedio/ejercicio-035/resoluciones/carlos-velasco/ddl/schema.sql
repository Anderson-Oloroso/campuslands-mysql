CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS servicios;
DROP TABLE IF EXISTS motos;

CREATE TABLE motos (
    id_moto INT UNSIGNED AUTO_INCREMENT,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    cilindrada INT UNSIGNED NOT NULL,
    anio SMALLINT UNSIGNED NOT NULL,
    estado ENUM('activa', 'mantenimiento', 'inactiva') NOT NULL DEFAULT 'activa',

    PRIMARY KEY (id_moto),
    CHECK (cilindrada > 0),
    CHECK (anio BETWEEN 2000 AND 2030)
);

CREATE TABLE servicios (
    id_servicio INT UNSIGNED AUTO_INCREMENT,
    id_moto INT UNSIGNED NOT NULL,
    tipo_servicio VARCHAR(80) NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    fecha_servicio DATE NOT NULL,
    estado ENUM('pendiente', 'completado') NOT NULL DEFAULT 'pendiente',

    PRIMARY KEY (id_servicio),
    CONSTRAINT fk_servicios_motos
        FOREIGN KEY (id_moto)
        REFERENCES motos(id_moto),
    CHECK (costo >= 0)
);