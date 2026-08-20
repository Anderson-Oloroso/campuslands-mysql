CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS formulas_quimicas;

CREATE TABLE formulas_quimicas (
    id_formula INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    codigo_formula VARCHAR(20) NOT NULL UNIQUE,
    nombre_formula VARCHAR(100) NOT NULL,
    compuesto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    masa_molar DECIMAL(10, 3) NOT NULL,
    fecha_registro DATE NOT NULL,
    estado ENUM('activa', 'en_revision', 'inactiva') NOT NULL DEFAULT 'en_revision',

    CONSTRAINT chk_formulas_masa_molar
        CHECK (masa_molar > 0)
);