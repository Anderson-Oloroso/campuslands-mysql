CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS servicios_mecanicos;

CREATE TABLE servicios_mecanicos (
    id_servicio INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cliente VARCHAR(100) NOT NULL,
    marca_moto VARCHAR(50) NOT NULL,
    modelo_moto VARCHAR(60) NOT NULL,
    tipo_servicio VARCHAR(80) NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    fecha_servicio DATE NOT NULL,
    estado ENUM('pendiente', 'en_proceso', 'finalizado')
        NOT NULL DEFAULT 'pendiente',

    CONSTRAINT chk_servicio_costo
        CHECK (costo >= 0)
);