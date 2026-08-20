CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS proyectos_digitales;

CREATE TABLE proyectos_digitales (
    id_proyecto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(100) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    tecnica VARCHAR(50) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    horas_trabajo DECIMAL(5, 2) NOT NULL,
    fecha_entrega DATE NOT NULL,
    estado ENUM('pendiente', 'en_proceso', 'finalizado', 'cancelado') NOT NULL DEFAULT 'pendiente',

    CONSTRAINT chk_proyectos_precio
        CHECK (precio > 0),

    CONSTRAINT chk_proyectos_horas
        CHECK (horas_trabajo > 0)
);