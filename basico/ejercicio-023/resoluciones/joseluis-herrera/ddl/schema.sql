CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE proyectos_arquitectura (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo_proyecto VARCHAR(50) NOT NULL,
    presupuesto DECIMAL(10,2) NOT NULL,
    estado ENUM('planificado', 'en_progreso', 'finalizado', 'pausado')
        NOT NULL DEFAULT 'planificado',
    fecha_inicio DATE NOT NULL,

    CONSTRAINT chk_presupuesto_positivo
        CHECK (presupuesto >= 0)
);