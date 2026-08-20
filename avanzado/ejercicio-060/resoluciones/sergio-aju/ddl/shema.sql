-- Campuslands MySQL - Avanzado Ejercicio 060
-- Optimización e Indexación para Equipo de Streaming

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Limpieza preventiva
DROP TABLE IF EXISTS metricas_transmision;
DROP TABLE IF EXISTS transmisiones;
DROP TABLE IF EXISTS equipos_hardware;
DROP TABLE IF EXISTS creadores;

-- 1. Tabla: Creadores de Contenido / Streamers
CREATE TABLE creadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    alias VARCHAR(50) UNIQUE NOT NULL,
    plataforma ENUM('Twitch', 'YouTube', 'Kick') NOT NULL,
    categoria_principal VARCHAR(50) NOT NULL,
    estado ENUM('Activo', 'Inactivo') NOT NULL DEFAULT 'Activo',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 2. Tabla: Equipos Hardware
CREATE TABLE equipos_hardware (
    id INT AUTO_INCREMENT PRIMARY KEY,
    creador_id INT NOT NULL,
    tipo_componente ENUM('Camara', 'Micrófono', 'Capturadora', 'Iluminación', 'Encoder GPU') NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (creador_id) REFERENCES creadores(id) ON DELETE CASCADE,
    CONSTRAINT chk_costo CHECK (costo >= 0)
) ENGINE=InnoDB;

-- 3. Tabla: Transmisiones
CREATE TABLE transmisiones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    creador_id INT NOT NULL,
    titulo_stream VARCHAR(120) NOT NULL,
    duracion_minutos INT NOT NULL,
    espectadores_pico INT NOT NULL DEFAULT 0,
    calidad_resolucion VARCHAR(20) NOT NULL DEFAULT '1080p60',
    fecha_transmision DATETIME NOT NULL,
    FOREIGN KEY (creador_id) REFERENCES creadores(id) ON DELETE CASCADE,
    CONSTRAINT chk_duracion_stream CHECK (duracion_minutos > 0)
) ENGINE=InnoDB;

-- 4. Tabla: Métricas Técnicas por Transmisión
CREATE TABLE metricas_transmision (
    id INT AUTO_INCREMENT PRIMARY KEY,
    transmision_id INT NOT NULL,
    bitrate_promedio_kbps INT NOT NULL,
    fps_promedio DECIMAL(4,1) NOT NULL,
    marcos_perdidos_pct DECIMAL(5,2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (transmision_id) REFERENCES transmisiones(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- =================================================================
-- ESTRATEGIA DE OPTIMIZACIÓN E ÍNDICES
-- =================================================================

-- Índice compuesto para acelerar búsquedas de streams por creador y fecha
CREATE INDEX idx_transmisiones_creador_fecha 
ON transmisiones (creador_id, fecha_transmision DESC);

-- Índice compuesto para optimizar rankings de audiencia por plataforma
CREATE INDEX idx_creadores_plataforma_estado 
ON creadores (plataforma, estado);

-- Índice de cobertura para análisis de rendimiento técnico
CREATE INDEX idx_metricas_rendimiento 
ON metricas_transmision (transmision_id, bitrate_promedio_kbps, marcos_perdidos_pct);