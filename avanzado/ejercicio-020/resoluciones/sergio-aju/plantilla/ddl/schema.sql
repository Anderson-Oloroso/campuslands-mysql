-- Campuslands MySQL - Avanzado Ejercicio 020
-- Temática: Estudio de Tatuajes (Uso de Índices para Optimización)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS citas_tatuajes;

CREATE TABLE citas_tatuajes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente VARCHAR(100) NOT NULL,
    estilo_diseno VARCHAR(80) NOT NULL,
    zona_cuerpo VARCHAR(80) NOT NULL,
    duracion_horas DECIMAL(4,1) NOT NULL DEFAULT 1.0,
    costo_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    calificacion DECIMAL(3,2) NOT NULL DEFAULT 0.00,
    fecha_cita DATE NOT NULL,
    estado ENUM('completada', 'pendiente', 'cancelada') NOT NULL DEFAULT 'pendiente'
);

-- ==========================================
-- CREACIÓN DE ÍNDICES PARA OPTIMIZACIÓN
-- ==========================================

-- 1. Índice simple para acelerar las búsquedas por estilo de diseño
CREATE INDEX idx_estilo ON citas_tatuajes(estilo_diseno);

-- 2. Índice compuesto para acelerar reportes filtrados por estado y ordenados/filtrados por fecha
CREATE INDEX idx_estado_fecha ON citas_tatuajes(estado, fecha_cita);

-- 3. Índice para optimizar consultas de rango por costo y calificación
CREATE INDEX idx_costo_calificacion ON citas_tatuajes(costo_total, calificacion);