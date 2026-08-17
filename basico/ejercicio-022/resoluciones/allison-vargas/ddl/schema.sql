-- Creación de la base de datos si no existe
CREATE DATABASE IF NOT EXISTS animacion_3d_db;
USE animacion_3d_db;

-- Limpieza preventiva
DROP TABLE IF EXISTS renders_3d;

-- Tabla principal: renders_3d
CREATE TABLE renders_3d (
    id_render INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(100) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    software_render VARCHAR(50) NOT NULL,
    total_frames INT NOT NULL CHECK (total_frames > 0),
    tiempo_render_minutos DECIMAL(6,2) NOT NULL CHECK (tiempo_render_minutos > 0),
    resolucion VARCHAR(20) NOT NULL,
    costo_farm_usd DECIMAL(10,2) DEFAULT 0.00 CHECK (costo_farm_usd >= 0),
    estado ENUM('pendiente', 'procesando', 'completado', 'fallido') DEFAULT 'pendiente',
    fecha_render DATE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
