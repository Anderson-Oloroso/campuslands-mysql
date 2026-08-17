-- DDL: Estructura e Índices de Optimización para Estudio de Tatuajes
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS citas_tatuajes;
DROP TABLE IF EXISTS tatuadores;

CREATE TABLE tatuadores (
    tatuador_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_tatuador VARCHAR(15) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    especialidad ENUM('realismo', 'tradicional', 'neotradicional', 'blackwork', 'fine line', 'anime') NOT NULL,
    experiencia_anios INT NOT NULL CHECK (experiencia_anios >= 0),
    tarifa_hora DECIMAL(8,2) NOT NULL CHECK (tarifa_hora > 0.00)
) ENGINE=InnoDB;

CREATE TABLE citas_tatuajes (
    cita_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_cita VARCHAR(15) NOT NULL UNIQUE,
    tatuador_id INT NOT NULL,
    cliente_nombre VARCHAR(100) NOT NULL,
    estilo ENUM('realismo', 'tradicional', 'neotradicional', 'blackwork', 'fine line', 'anime') NOT NULL,
    zona_cuerpo VARCHAR(50) NOT NULL,
    duracion_horas DECIMAL(4,2) NOT NULL CHECK (duracion_horas > 0.00),
    monto_total DECIMAL(8,2) NOT NULL CHECK (monto_total >= 0.00),
    estado ENUM('programada', 'completada', 'cancelada') NOT NULL DEFAULT 'programada',
    fecha_cita DATE NOT NULL,
    FOREIGN KEY (tatuador_id) REFERENCES tatuadores(tatuador_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- CREACIÓN DE ÍNDICES PARA OPTIMIZACIÓN DE CONSULTAS
-- 1. Índice simple para búsquedas de citas por fecha
CREATE INDEX idx_citas_fecha ON citas_tatuajes(fecha_cita);

-- 2. Índice simple para filtrar por estado del trabajo
CREATE INDEX idx_citas_estado ON citas_tatuajes(estado);

-- 3. Índice compuesto para consultas frecuentes por tatuador y estado de la cita
CREATE INDEX idx_tatuador_estado ON citas_tatuajes(tatuador_id, estado);

-- 4. Índice compuesto para filtrados por estilo de diseño y rango de montos
CREATE INDEX idx_estilo_monto ON citas_tatuajes(estilo, monto_total);
