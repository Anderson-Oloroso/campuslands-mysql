-- Creacion de la base de datos si no existe
CREATE DATABASE IF NOT EXISTS arquitectura_3d_update_db;
USE arquitectura_3d_update_db;

-- Limpieza preventiva
DROP TABLE IF EXISTS render_escenas;

-- Tabla principal: Escenas 3D y Modelos Arquitectonicos
CREATE TABLE render_escenas (
    id_escena INT AUTO_INCREMENT PRIMARY KEY,
    nombre_escena VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    precio_base_usd DECIMAL(10,2) NOT NULL CHECK (precio_base_usd >= 0),
    poligonos_k INT NOT NULL CHECK (poligonos_k > 0),
    estado ENUM('en_proceso', 'revisado', 'publicado', 'archivado') DEFAULT 'en_proceso',
    fecha_modificacion DATE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
