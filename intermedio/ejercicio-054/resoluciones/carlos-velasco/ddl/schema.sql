CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS trabajos_soldadura;
DROP TABLE IF EXISTS soldadores;

CREATE TABLE soldadores (
    soldador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    experiencia_anios INT NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_experiencia_soldador
        CHECK (experiencia_anios >= 0)
);

CREATE TABLE trabajos_soldadura (
    trabajo_id INT AUTO_INCREMENT PRIMARY KEY,
    soldador_id INT NOT NULL,
    tipo_trabajo VARCHAR(100) NOT NULL,
    material VARCHAR(100) NOT NULL,
    fecha_trabajo DATE NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    estado ENUM('pendiente', 'en_proceso', 'finalizado') NOT NULL DEFAULT 'pendiente',

    CONSTRAINT fk_trabajo_soldador
        FOREIGN KEY (soldador_id)
        REFERENCES soldadores(soldador_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_costo_trabajo
        CHECK (costo >= 0)
);