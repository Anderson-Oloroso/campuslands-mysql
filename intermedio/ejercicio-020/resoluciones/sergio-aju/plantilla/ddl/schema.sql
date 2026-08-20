-- Campuslands MySQL - Intermedio Ejercicio 020
-- Temática: Estudio de Tatuajes (Uso de Subconsultas)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS citas_tatuajes;
DROP TABLE IF EXISTS tatuadores;

CREATE TABLE tatuadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(80) NOT NULL,
    tarifa_por_hora DECIMAL(10,2) NOT NULL DEFAULT 50.00,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
);

CREATE TABLE citas_tatuajes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tatuador_id INT NOT NULL,
    cliente VARCHAR(100) NOT NULL,
    estilo_diseno VARCHAR(80) NOT NULL,
    duracion_horas DECIMAL(4,1) NOT NULL DEFAULT 1.0,
    costo_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    calificacion DECIMAL(3,2) NOT NULL DEFAULT 0.00,
    estado_cita ENUM('completada', 'pendiente', 'cancelada') NOT NULL DEFAULT 'pendiente',
    FOREIGN KEY (tatuador_id) REFERENCES tatuadores(id) ON DELETE CASCADE
);