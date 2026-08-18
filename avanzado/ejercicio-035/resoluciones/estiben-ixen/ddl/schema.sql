-- Campuslands MySQL - avanzado ejercicio-035
-- Tema: taller mecanico de motos (indices)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS log_auditoria_taller_motos;
DROP TABLE IF EXISTS servicios_taller;
DROP TABLE IF EXISTS mecanicos;

CREATE TABLE mecanicos (
    id_mecanico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(70) NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    rango ENUM('Junior','Intermedio','Senior') NOT NULL,
    estado ENUM('Disponible','Ocupado','Vacaciones') DEFAULT 'Disponible'
);

CREATE TABLE servicios_taller (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    moto VARCHAR(50) NOT NULL,
    placa VARCHAR(20) NOT NULL,
    id_mecanico INT NOT NULL,
    descripcion VARCHAR(150) NOT NULL,
    costo DECIMAL(8,2) NOT NULL DEFAULT 0,
    estado ENUM('Pendiente','En Proceso','Finalizado','Cancelado') DEFAULT 'Pendiente',
    fecha_servicio DATE NOT NULL,
    FOREIGN KEY (id_mecanico) REFERENCES mecanicos(id_mecanico) ON DELETE RESTRICT
);

-- Creacion de Indices Optimizados
CREATE INDEX idx_taller_motos_fk ON servicios_taller(id_mecanico);
CREATE INDEX idx_taller_motos_metric ON servicios_taller(descripcion DESC);
CREATE INDEX idx_taller_motos_compuesto ON servicios_taller(id_mecanico, descripcion);
