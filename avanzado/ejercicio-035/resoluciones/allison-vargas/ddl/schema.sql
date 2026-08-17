DROP DATABASE IF EXISTS taller_motos_indices_db;
CREATE DATABASE taller_motos_indices_db;
USE taller_motos_indices_db;

CREATE TABLE taller_motos (
    id_reparacion INT AUTO_INCREMENT PRIMARY KEY,
    placa_moto VARCHAR(10) NOT NULL,
    propietario VARCHAR(60) NOT NULL,
    modelo_moto VARCHAR(50) NOT NULL,
    costo_servicio DECIMAL(10, 2) NOT NULL,
    fecha_ingreso DATE NOT NULL,
    estado_reparacion VARCHAR(25) NOT NULL,
    CONSTRAINT chk_costo_servicio CHECK (costo_servicio >= 0.00),
    CONSTRAINT chk_estado_reparacion CHECK (estado_reparacion IN ('Pendiente', 'En Proceso', 'Finalizado', 'Entregado'))
);

-- Creación de índices estratégicos para optimizar consultas frecuentes
CREATE INDEX idx_placa ON taller_motos(placa_moto);
CREATE INDEX idx_estado ON taller_motos(estado_reparacion);
CREATE INDEX idx_fecha ON taller_motos(fecha_ingreso);
CREATE UNIQUE INDEX idx_unica_reparacion_activa ON taller_motos(id_reparacion, placa_moto);
