CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS formulas_quimicas;

CREATE TABLE formulas_quimicas (
    id_formula INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    codigo_formula VARCHAR(20) NOT NULL UNIQUE,
    nombre_formula VARCHAR(100) NOT NULL,
    compuesto_principal VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    cantidad_muestras INT UNSIGNED NOT NULL,
    cantidad_reactivo DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    fecha_registro DATE NOT NULL,
    CONSTRAINT chk_muestras_formula CHECK (cantidad_muestras > 0),
    CONSTRAINT chk_reactivo_formula CHECK (cantidad_reactivo > 0),
    CONSTRAINT chk_estado_formula CHECK (
        estado IN ('activa', 'inactiva')
    )
);