CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS formulas_quimicas;

CREATE TABLE formulas_quimicas (
    id_formula INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_formula VARCHAR(100) NOT NULL,
    compuesto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    cantidad_muestras INT UNSIGNED NOT NULL,
    costo_muestra DECIMAL(10, 2) NOT NULL,
    estado ENUM('activa', 'en_revision', 'archivada')
        NOT NULL DEFAULT 'activa',

    CONSTRAINT chk_cantidad_muestras
        CHECK (cantidad_muestras > 0),

    CONSTRAINT chk_costo_muestra
        CHECK (costo_muestra >= 0)
);