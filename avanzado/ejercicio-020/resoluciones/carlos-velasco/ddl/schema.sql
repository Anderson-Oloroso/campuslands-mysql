-- ============================================================
-- Ejercicio 020 - Indices para estudio de tatuajes
-- Base de datos: campuslands_mysql
-- ============================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

-- ------------------------------------------------------------
-- Tabla: tatuadores
-- ------------------------------------------------------------
CREATE TABLE tatuadores (
    id_tatuador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(80) NOT NULL,
    experiencia_anios INT NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_tatuadores_experiencia
        CHECK (experiencia_anios >= 0)
);

-- ------------------------------------------------------------
-- Tabla: clientes
-- ------------------------------------------------------------
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
);

-- ------------------------------------------------------------
-- Tabla: citas
-- ------------------------------------------------------------
CREATE TABLE citas (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_tatuador INT NOT NULL,
    fecha_cita DATETIME NOT NULL,
    estilo VARCHAR(80) NOT NULL,
    tamano_cm DECIMAL(5, 2) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    estado ENUM(
        'programada',
        'realizada',
        'cancelada'
    ) NOT NULL DEFAULT 'programada',

    CONSTRAINT fk_citas_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    CONSTRAINT fk_citas_tatuador
        FOREIGN KEY (id_tatuador)
        REFERENCES tatuadores(id_tatuador),

    CONSTRAINT chk_citas_tamano
        CHECK (tamano_cm > 0),

    CONSTRAINT chk_citas_precio
        CHECK (precio > 0)
);

-- ------------------------------------------------------------
-- Indices
-- ------------------------------------------------------------

-- Consultas por estado de tatuadores.
CREATE INDEX idx_tatuadores_estado
    ON tatuadores(estado);

-- Consultas por especialidad.
CREATE INDEX idx_tatuadores_especialidad
    ON tatuadores(especialidad);

-- Consultas de clientes activos.
CREATE INDEX idx_clientes_estado
    ON clientes(estado);

-- Consultas y ordenamiento por fecha de cita.
CREATE INDEX idx_citas_fecha
    ON citas(fecha_cita);

-- Consultas por estado de cita.
CREATE INDEX idx_citas_estado
    ON citas(estado);

-- Indice compuesto para consultas que filtran por tatuador
-- y posteriormente trabajan con la fecha de la cita.
CREATE INDEX idx_citas_tatuador_fecha
    ON citas(id_tatuador, fecha_cita);

-- Indice compuesto para consultar citas por cliente y estado.
CREATE INDEX idx_citas_cliente_estado
    ON citas(id_cliente, estado);