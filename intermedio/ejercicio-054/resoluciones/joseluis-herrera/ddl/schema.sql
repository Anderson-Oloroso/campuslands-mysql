CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS trabajos_soldadura;
DROP TABLE IF EXISTS soldadores;

CREATE TABLE soldadores (
    id_soldador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(60) NOT NULL,
    experiencia_anios TINYINT UNSIGNED NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT chk_experiencia_soldador CHECK (experiencia_anios >= 0),
    CONSTRAINT chk_estado_soldador CHECK (
        estado IN ('activo', 'inactivo')
    )
);

CREATE TABLE trabajos_soldadura (
    id_trabajo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_soldador INT UNSIGNED NOT NULL,
    nombre_trabajo VARCHAR(100) NOT NULL,
    tipo_soldadura VARCHAR(50) NOT NULL,
    horas_trabajadas DECIMAL(6, 2) NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    fecha_trabajo DATE NOT NULL,
    CONSTRAINT chk_horas_trabajo CHECK (horas_trabajadas > 0),
    CONSTRAINT chk_costo_trabajo CHECK (costo > 0),
    CONSTRAINT fk_trabajo_soldador
        FOREIGN KEY (id_soldador)
        REFERENCES soldadores(id_soldador)
);