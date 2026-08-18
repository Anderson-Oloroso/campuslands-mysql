CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS servicios_taller;

CREATE TABLE servicios_taller (
    id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    tipo_servicio VARCHAR(50) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    fecha_servicio DATE NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,

    CONSTRAINT chk_servicios_costo
        CHECK (costo > 0),

    CONSTRAINT chk_servicios_estado
        CHECK (estado IN ('pendiente', 'en proceso', 'finalizado'))
);