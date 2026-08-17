-- Creacion de la base de datos si no existe
CREATE DATABASE IF NOT EXISTS soldadura_bloqueos_db;
USE soldadura_bloqueos_db;

-- Limpieza preventiva
DROP TABLE IF EXISTS asignacion_insumos;
DROP TABLE IF EXISTS inventario_insumos;
DROP TABLE IF EXISTS estaciones_soldadura;

-- Tabla 1: Estaciones de Soldadura
CREATE TABLE estaciones_soldadura (
    id_estacion INT AUTO_INCREMENT PRIMARY KEY,
    codigo_estacion VARCHAR(20) UNIQUE NOT NULL,
    tipo_proceso ENUM('SMAW', 'GMAW', 'GTAW', 'FCAW') NOT NULL,
    estado ENUM('disponible', 'en_uso', 'bloqueada_mantenimiento') DEFAULT 'disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla 2: Inventario de Insumos y Electrodos
CREATE TABLE inventario_insumos (
    id_insumo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_insumo VARCHAR(100) NOT NULL,
    tipo_material VARCHAR(50) NOT NULL,
    stock_kg DECIMAL(10,2) NOT NULL CHECK (stock_kg >= 0),
    precio_por_kg DECIMAL(8,2) NOT NULL CHECK (precio_por_kg > 0),
    version_bloqueo INT DEFAULT 1 -- Control de concurrencia
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla 3: Asignacion de Insumos a Estaciones (Transaccional)
CREATE TABLE asignacion_insumos (
    id_asignacion INT AUTO_INCREMENT PRIMARY KEY,
    id_estacion INT NOT NULL,
    id_insumo INT NOT NULL,
    cantidad_asignada_kg DECIMAL(8,2) NOT NULL CHECK (cantidad_asignada_kg > 0),
    fecha_asignacion DATETIME NOT NULL,
    FOREIGN KEY (id_estacion) REFERENCES estaciones_soldadura(id_estacion) ON DELETE CASCADE,
    FOREIGN KEY (id_insumo) REFERENCES inventario_insumos(id_insumo) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
