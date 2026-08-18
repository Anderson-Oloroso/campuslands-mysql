CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS servicios_mecanicos;

CREATE TABLE servicios_mecanicos (
    id_servicio INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    tipo_servicio VARCHAR(50) NOT NULL,
    fecha_ingreso DATE NOT NULL,
    fecha_salida DATE NULL,
    estado ENUM('pendiente', 'en_proceso', 'finalizado') NOT NULL DEFAULT 'pendiente',
    costo DECIMAL(10, 2) NOT NULL,
    
    CONSTRAINT chk_costo_positivo
        CHECK (costo >= 0),

    CONSTRAINT chk_fechas_servicio
        CHECK (fecha_salida IS NULL OR fecha_salida >= fecha_ingreso)
);

CREATE INDEX idx_servicios_placa
    ON servicios_mecanicos (placa);

CREATE INDEX idx_servicios_estado
    ON servicios_mecanicos (estado);

CREATE INDEX idx_servicios_fecha_ingreso
    ON servicios_mecanicos (fecha_ingreso);