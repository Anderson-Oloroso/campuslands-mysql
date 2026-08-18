CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS ordenes_soldadura;

CREATE TABLE ordenes_soldadura (
    id_orden INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cliente VARCHAR(100) NOT NULL,
    tipo_soldadura VARCHAR(80) NOT NULL,
    material VARCHAR(80) NOT NULL,
    peso_kg DECIMAL(8,2) NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    estado ENUM('pendiente', 'en_proceso', 'finalizada', 'cancelada')
        NOT NULL DEFAULT 'pendiente',
    fecha_orden DATE NOT NULL,

    CONSTRAINT chk_orden_peso
        CHECK (peso_kg > 0),

    CONSTRAINT chk_orden_costo
        CHECK (costo > 0)
) ENGINE = InnoDB;