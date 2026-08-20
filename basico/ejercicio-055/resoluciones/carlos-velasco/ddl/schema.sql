CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS formulas_quimicas;

CREATE TABLE formulas_quimicas (
    formula_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    formula VARCHAR(100) NOT NULL,
    categoria VARCHAR(80) NOT NULL,
    cantidad_muestras INT NOT NULL DEFAULT 0,
    costo_muestra DECIMAL(10, 2) NOT NULL,
    estado ENUM('activa', 'inactiva') NOT NULL DEFAULT 'activa',

    CONSTRAINT uq_formula_quimica
        UNIQUE (formula),

    CONSTRAINT chk_cantidad_muestras
        CHECK (cantidad_muestras >= 0),

    CONSTRAINT chk_costo_muestra
        CHECK (costo_muestra >= 0)
);