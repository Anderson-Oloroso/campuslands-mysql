CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Limpieza previa
DROP TABLE IF EXISTS servicios_taller;
DROP TABLE IF EXISTS clientes_taller;

CREATE TABLE clientes_taller (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE,
    INDEX idx_nombre_cliente (nombre)
);

CREATE TABLE servicios_taller (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    tipo_servicio VARCHAR(50) NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    fecha_servicio DATE NOT NULL,
    estado ENUM('pendiente', 'en_proceso', 'completado') DEFAULT 'pendiente',
    CONSTRAINT fk_cliente_servicio FOREIGN KEY (cliente_id) REFERENCES clientes_taller(id),
    -- Índices para mejorar rendimiento en consultas frecuentes
    INDEX idx_fecha_servicio (fecha_servicio),
    INDEX idx_tipo_servicio (tipo_servicio),
    INDEX idx_estado_servicio (estado)
);