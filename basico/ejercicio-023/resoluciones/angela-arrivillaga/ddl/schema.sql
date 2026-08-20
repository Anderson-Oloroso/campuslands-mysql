CREATE DATABASE IF NOT EXISTS arquitectura_3d_db;
USE arquitectura_3d_db;

CREATE TABLE proyectos_arquitectura (
    id_proyecto INT PRIMARY KEY AUTO_INCREMENT,
    codigo_proyecto VARCHAR(20) NOT NULL UNIQUE,
    nombre_proyecto VARCHAR(100) NOT NULL,
    software_bim VARCHAR(50) NOT NULL,
    presupuesto_usd DECIMAL(10,2) NOT NULL,
    calificacion_cliente DECIMAL(3,2) NOT NULL,
    estado_proyecto ENUM('en_diseno', 'render_final', 'entregado', 'revision') DEFAULT 'en_diseno',
    CONSTRAINT chk_presupuesto CHECK (presupuesto_usd > 0.00),
    CONSTRAINT chk_calificacion_arq CHECK (calificacion_cliente >= 0.00 AND calificacion_cliente <= 5.00)
);