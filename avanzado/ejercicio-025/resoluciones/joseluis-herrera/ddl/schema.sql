CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE formulas_quimicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_formula VARCHAR(20) NOT NULL,
    nombre_formula VARCHAR(100) NOT NULL,
    compuesto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    cantidad_muestras INT NOT NULL,
    costo_muestra DECIMAL(10,2) NOT NULL,
    estado ENUM('activa', 'en_revision', 'archivada')
        NOT NULL DEFAULT 'activa',

    CONSTRAINT uq_codigo_formula
        UNIQUE (codigo_formula),

    CONSTRAINT uq_compuesto
        UNIQUE (compuesto),

    CONSTRAINT chk_cantidad_muestras
        CHECK (cantidad_muestras > 0),

    CONSTRAINT chk_costo_muestra
        CHECK (costo_muestra >= 0)
) ENGINE = InnoDB;