CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS trabajos_soldadura;
DROP TABLE IF EXISTS soldadores;

CREATE TABLE soldadores (
    id_soldador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    especialidad VARCHAR(60) NOT NULL,
    nivel_experiencia ENUM('principiante', 'intermedio', 'avanzado') NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
);

CREATE TABLE trabajos_soldadura (
    id_trabajo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_soldador INT UNSIGNED NOT NULL,
    tipo_soldadura VARCHAR(50) NOT NULL,
    material VARCHAR(50) NOT NULL,
    descripcion VARCHAR(150) NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    fecha_trabajo DATE NOT NULL,
    estado ENUM('pendiente', 'en_proceso', 'finalizado', 'cancelado') NOT NULL DEFAULT 'pendiente',

    CONSTRAINT fk_trabajos_soldador
        FOREIGN KEY (id_soldador)
        REFERENCES soldadores(id_soldador),

    CONSTRAINT chk_trabajos_costo
        CHECK (costo > 0)
);