CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS formulas_quimicas;

CREATE TABLE formulas_quimicas (
    formula_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    formula VARCHAR(50) NOT NULL,
    categoria VARCHAR(80) NOT NULL,
    cantidad_muestras INT NOT NULL DEFAULT 0,
    estado ENUM('activa', 'inactiva') NOT NULL DEFAULT 'activa',

    CONSTRAINT uq_formula_quimica
        UNIQUE (formula),

    CONSTRAINT chk_cantidad_muestras
        CHECK (cantidad_muestras >= 0)
);