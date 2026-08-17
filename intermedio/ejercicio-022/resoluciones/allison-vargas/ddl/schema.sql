-- Creacion de la base de datos si no existe
CREATE DATABASE IF NOT EXISTS animacion_3d_2fn_db;
USE animacion_3d_2fn_db;

-- Limpieza preventiva
DROP TABLE IF EXISTS proyectos_render;
DROP TABLE IF EXISTS motores_render;
DROP TABLE IF EXISTS artistas;

-- Tabla 1: Artistas / Creadores (Cumple 2FN)
CREATE TABLE artistas (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla 2: Motores de Render (Cumple 2FN)
CREATE TABLE motores_render (
    id_motor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_engine VARCHAR(50) NOT NULL,
    tipo ENUM('GPU', 'CPU', 'Hibrido') DEFAULT 'GPU',
    costo_base_hora DECIMAL(8,2) NOT NULL CHECK (costo_base_hora >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla 3: Proyectos de Render (Tabla relacional principal)
CREATE TABLE proyectos_render (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_escena VARCHAR(100) NOT NULL,
    id_artista INT NOT NULL,
    id_motor INT NOT NULL,
    total_frames INT NOT NULL CHECK (total_frames > 0),
    tiempo_horas DECIMAL(6,2) NOT NULL CHECK (tiempo_horas > 0),
    costo_total DECIMAL(10,2) NOT NULL CHECK (costo_total >= 0),
    estado ENUM('borrador', 'renderizando', 'completado', 'error') DEFAULT 'borrador',
    fecha_inicio DATE NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES artistas(id_artista) ON DELETE CASCADE,
    FOREIGN KEY (id_motor) REFERENCES motores_render(id_motor) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;