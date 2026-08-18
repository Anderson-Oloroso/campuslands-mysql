CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS formulas_quimicas;

CREATE TABLE formulas_quimicas (
    id_formula INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_formula VARCHAR(100) NOT NULL,
    formula_molecular VARCHAR(100) NOT NULL,
    categoria VARCHAR(60) NOT NULL,
    cantidad_muestras INT UNSIGNED NOT NULL,
    costo_estimado DECIMAL(10,2) NOT NULL,
    estado ENUM('activa', 'inactiva') NOT NULL DEFAULT 'activa',
    fecha_registro DATE NOT NULL,
    CONSTRAINT chk_cantidad_muestras CHECK (cantidad_muestras > 0),
    CONSTRAINT chk_costo_estimado CHECK (costo_estimado >= 0)
);