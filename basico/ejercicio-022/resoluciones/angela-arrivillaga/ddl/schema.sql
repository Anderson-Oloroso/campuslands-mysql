CREATE DATABASE IF NOT EXISTS animacion_3d_db;
USE animacion_3d_db;

CREATE TABLE proyectos_animacion (
    id_proyecto INT PRIMARY KEY AUTO_INCREMENT,
    codigo_proyecto VARCHAR(20) NOT NULL UNIQUE,
    nombre_proyecto VARCHAR(100) NOT NULL,
    software_3d VARCHAR(50) NOT NULL,
    tiempo_render_horas INT NOT NULL,
    calificacion_tecnica DECIMAL(3,2) NOT NULL,
    estado_proyecto ENUM('completado', 'en_produccion', 'revision', 'cancelado') DEFAULT 'completado',
    CONSTRAINT chk_tiempo_render CHECK (tiempo_render_horas > 0),
    CONSTRAINT chk_calificacion_tecnica CHECK (calificacion_tecnica >= 0.00 AND calificacion_tecnica <= 5.00)
);