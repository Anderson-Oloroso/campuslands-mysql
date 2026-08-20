-- Campuslands MySQL - avanzado ejercicio 050
-- Optimización e Índices para Estudio de Tatuajes

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS citas;
DROP TABLE IF EXISTS artistas;
DROP TABLE IF EXISTS clientes;

-- Tabla de Clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(120) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_cliente_email UNIQUE (email)
) ENGINE=InnoDB;

-- Tabla de Tatuadores / Artistas
CREATE TABLE artistas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    estilo_principal VARCHAR(60) NOT NULL, -- Ej. Realismo, Neotradicional, Blackwork, Fine Line
    tarifa_por_hora DECIMAL(10,2) NOT NULL,
    estado ENUM('activo', 'licencia', 'inactivo') NOT NULL DEFAULT 'activo',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_tarifa_positiva CHECK (tarifa_por_hora >= 0)
) ENGINE=InnoDB;

-- Tabla de Citas / Sesiones de Tatuaje
CREATE TABLE citas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    artista_id INT NOT NULL,
    estilo VARCHAR(60) NOT NULL,
    zona_cuerpo VARCHAR(60) NOT NULL,
    descripcion_diseno TEXT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    horas_estimadas DECIMAL(4,2) NOT NULL DEFAULT 1.0,
    costo_total DECIMAL(10,2) NOT NULL,
    estado ENUM('programada', 'completada', 'cancelada') NOT NULL DEFAULT 'programada',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (artista_id) REFERENCES artistas(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_costo_positivo CHECK (costo_total >= 0),
    CONSTRAINT chk_horas_positivas CHECK (horas_estimadas > 0)
) ENGINE=InnoDB;

-- ============================================================================
-- ESTRATEGIA DE ÍNDICES DE RENDIMIENTO
-- ============================================================================

-- 1. Índice compuesto para acelerar búsquedas por artista, estado y fecha de cita
CREATE INDEX idx_citas_artista_estado_fecha 
ON citas (artista_id, estado, fecha_hora);

-- 2. Índice B-Tree para filtrado rápido por estilo de tatuaje y rango de precio
CREATE INDEX idx_citas_estilo_costo 
ON citas (estilo, costo_total);

-- 3. Índice en fecha de cita para acelerar reportes de agenda e intemperie
CREATE INDEX idx_citas_fecha 
ON citas (fecha_hora);

-- 4. Índice FULLTEXT para búsquedas por palabras clave en la descripción del diseño
CREATE FULLTEXT INDEX idx_citas_descripcion_ft 
ON citas (descripcion_diseno);