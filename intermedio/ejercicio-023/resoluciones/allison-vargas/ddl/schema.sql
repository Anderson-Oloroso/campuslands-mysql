-- Creacion de la base de datos si no existe
CREATE DATABASE IF NOT EXISTS arquitectura_3d_3fn_db;
USE arquitectura_3d_3fn_db;

-- Limpieza preventiva
DROP TABLE IF EXISTS proyectos_3d;
DROP TABLE IF EXISTS estudios_render;
DROP TABLE IF EXISTS clientes;

-- Tabla 1: Clientes (Entidad independiente)
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    pais VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla 2: Estudios de Renderizado (Entidad independiente)
CREATE TABLE estudios_render (
    id_estudio INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estudio VARCHAR(100) NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    tarifa_base_m2 DECIMAL(10,2) NOT NULL CHECK (tarifa_base_m2 > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla 3: Proyectos 3D (Cumple 3FN: sin dependencias transitivas)
CREATE TABLE proyectos_3d (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_estudio INT NOT NULL,
    nombre_proyecto VARCHAR(100) NOT NULL,
    m2_superficie DECIMAL(8,2) NOT NULL CHECK (m2_superficie > 0),
    costo_total_usd DECIMAL(12,2) NOT NULL CHECK (costo_total_usd >= 0),
    estado ENUM('en_diseno', 'en_render', 'entregado', 'cancelado') DEFAULT 'en_diseno',
    fecha_inicio DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE,
    FOREIGN KEY (id_estudio) REFERENCES estudios_render(id_estudio) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
