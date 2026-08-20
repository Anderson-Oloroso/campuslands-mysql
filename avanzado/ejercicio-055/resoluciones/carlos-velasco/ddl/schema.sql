CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS formulas_quimicas (
    id_formula INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    formula_quimica VARCHAR(50) NOT NULL UNIQUE,
    categoria VARCHAR(50) NOT NULL,
    masa_molar DECIMAL(10,3) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    fecha_registro DATE NOT NULL,
    
    CONSTRAINT chk_masa_molar_positiva
        CHECK (masa_molar > 0)
);