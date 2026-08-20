CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS trabajos_soldadura;

CREATE TABLE trabajos_soldadura (
    id_trabajo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_trabajo VARCHAR(100) NOT NULL,
    tipo_soldadura VARCHAR(50) NOT NULL,
    soldador VARCHAR(100) NOT NULL,
    horas_trabajadas DECIMAL(6, 2) NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    fecha_trabajo DATE NOT NULL,
    CONSTRAINT chk_horas_trabajo CHECK (horas_trabajadas > 0),
    CONSTRAINT chk_costo_trabajo CHECK (costo > 0),
    CONSTRAINT chk_estado_trabajo CHECK (
        estado IN ('activo', 'finalizado', 'cancelado')
    )
);