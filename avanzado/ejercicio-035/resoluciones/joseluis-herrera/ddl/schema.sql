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

    CONSTRAINT uq_servicios_placa_fecha
        UNIQUE (placa, fecha_servicio),

    CONSTRAINT chk_servicios_costo
        CHECK (costo > 0),

    CONSTRAINT chk_servicios_estado
        CHECK (estado IN ('pendiente', 'en proceso', 'finalizado')),

    CONSTRAINT chk_servicios_tipo
        CHECK (
            tipo_servicio IN (
                'mantenimiento',
                'cambio de aceite',
                'frenos',
                'motor',
                'suspension',
                'electricidad'
            )
        )
);

-- Indice para buscar rapidamente servicios por placa.
CREATE INDEX idx_servicios_placa
    ON servicios_taller (placa);

-- Indice para consultas que filtran servicios por estado.
CREATE INDEX idx_servicios_estado
    ON servicios_taller (estado);

-- Indice para consultas y reportes por fecha.
CREATE INDEX idx_servicios_fecha
    ON servicios_taller (fecha_servicio);

-- Indice compuesto para consultas que filtran
-- por estado y ordenan o analizan por fecha.
CREATE INDEX idx_servicios_estado_fecha
    ON servicios_taller (estado, fecha_servicio);