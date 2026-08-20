-- Campuslands MySQL - avanzado ejercicio 051
-- Análisis de Planes de Ejecución con EXPLAIN para Dibujo Digital

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS ilustraciones;
DROP TABLE IF EXISTS artistas_digitales;
DROP TABLE IF EXISTS software_herramientas;

-- Tabla de Software / Software de Ilustración
CREATE TABLE software_herramientas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    desarrollador VARCHAR(80) NOT NULL,
    licencia ENUM('Gratuito', 'Suscripción', 'Pago Único') NOT NULL,
    version_actual VARCHAR(20) NOT NULL,
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Tabla de Artistas Digitales
CREATE TABLE artistas_digitales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_artistico VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    estilo_predominante VARCHAR(60) NOT NULL, -- Ej. Concept Art, Anime, Lineart, 3D/2D Hybrid
    nivel ENUM('Principiante', 'Intermedio', 'Avanzado', 'Profesional') NOT NULL DEFAULT 'Intermedio',
    pais VARCHAR(60) NOT NULL,
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Tabla de Ilustraciones / Proyectos de Dibujo
CREATE TABLE ilustraciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    artista_id INT NOT NULL,
    software_id INT NOT NULL,
    titulo VARCHAR(120) NOT NULL,
    numero_capas INT NOT NULL DEFAULT 1,
    resolucion_px VARCHAR(20) NOT NULL, -- Ej. 3840x2160, 4090x4090
    tamano_archivo_mb DECIMAL(8,2) NOT NULL,
    tiempo_trabajo_horas DECIMAL(5,2) NOT NULL,
    estado ENUM('Borrador', 'En Proceso', 'Finalizado', 'Archivado') NOT NULL DEFAULT 'En Proceso',
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (artista_id) REFERENCES artistas_digitales(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (software_id) REFERENCES software_herramientas(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_capas_positivas CHECK (numero_capas > 0),
    CONSTRAINT chk_tiempo_positivo CHECK (tiempo_trabajo_horas >= 0.0)
) ENGINE=InnoDB;

-- ============================================================================
-- ÍNDICES PARA EL ANÁLISIS CON EXPLAIN
-- ============================================================================

-- Índice compuesto para acelerar búsquedas de ilustraciones por artista y estado
CREATE INDEX idx_ilustraciones_artista_estado 
ON ilustraciones (artista_id, estado);

-- Índice B-Tree para optimizar consultas por software utilizado y tiempo invertido
CREATE INDEX idx_ilustraciones_software_tiempo 
ON ilustraciones (software_id, tiempo_trabajo_horas);

-- Índice para acelerar filtros de ordenamiento por fecha de creación
CREATE INDEX idx_ilustraciones_fecha 
ON ilustraciones (fecha_creacion);