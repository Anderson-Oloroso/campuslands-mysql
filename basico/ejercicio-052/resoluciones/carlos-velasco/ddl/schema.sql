CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS proyectos_animacion;


CREATE TABLE proyectos_animacion (
    id_proyecto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    tipo_animacion VARCHAR(50) NOT NULL,
    artista_principal VARCHAR(100) NOT NULL,
    horas_produccion DECIMAL(8, 2) NOT NULL,
    presupuesto DECIMAL(10, 2) NOT NULL,
    fecha_entrega DATE NOT NULL,
    estado ENUM('planificado', 'en_produccion', 'finalizado')
        NOT NULL DEFAULT 'planificado',

    CONSTRAINT uq_proyectos_nombre
        UNIQUE (nombre),

    CONSTRAINT chk_proyectos_nombre
        CHECK (CHAR_LENGTH(TRIM(nombre)) >= 3),

    CONSTRAINT chk_proyectos_horas
        CHECK (horas_produccion > 0),

    CONSTRAINT chk_proyectos_presupuesto
        CHECK (presupuesto > 0)
);