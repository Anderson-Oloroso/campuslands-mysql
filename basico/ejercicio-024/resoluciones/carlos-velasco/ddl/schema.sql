CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS trabajos_soldadura;

CREATE TABLE trabajos_soldadura (
    id_trabajo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_trabajo VARCHAR(100) NOT NULL,
    soldador VARCHAR(100) NOT NULL,
    tipo_soldadura VARCHAR(50) NOT NULL,
    material VARCHAR(50) NOT NULL,
    horas_trabajo DECIMAL(6, 2) NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    estado ENUM('pendiente', 'en_proceso', 'finalizado', 'cancelado')
        NOT NULL DEFAULT 'pendiente',

    CONSTRAINT chk_horas_trabajo
        CHECK (horas_trabajo > 0),

    CONSTRAINT chk_costo
        CHECK (costo >= 0)
);